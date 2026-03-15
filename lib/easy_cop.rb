# frozen_string_literal: true

require 'rubocop'

class CollectingRunner < RuboCop::Runner
  attr_reader :offenses_by_file

  def initialize(options = {}, config_store = RuboCop::ConfigStore.new)
    super(options, config_store)
    @offenses_by_file = Hash.new { |h, k| h[k] = [] }
  end

  private

  def file_finished(file, offenses)
    @offenses_by_file[file].concat(offenses)
    super
  end
end

def find_least_offended_file
  config_store = RuboCop::ConfigStore.new
  runner       = CollectingRunner.new({}, config_store)
  runner.run([])

  offenses_count_by_file = runner.offenses_by_file
                                 .transform_values(&:size)
                                 .reject { |_file, count| count.zero? }

  return puts 'No offenses found. All files are clean!' if offenses_count_by_file.empty?

  min_file, count = offenses_count_by_file.min_by { |_file, c| c }
  file_path = Pathname.new(min_file).relative_path_from(Pathname.pwd).to_s

  puts <<-TEXT

        |                           |                             |
        |                           |                             |
       \\ /                         \\ /                           \\ /
        v                           v                             v
  TEXT
  puts "\nThe file with the least infractions is '#{file_path}' with #{count} offense(s)."
end

find_least_offended_file

require 'rubocop'

def find_least_offended_file

  config_store = RuboCop::ConfigStore.new
  result = RuboCop::Runner.new({}, config_store).run([])
  # TODO: result is true | false with lazy evaluation, we need an arrey of offenses
  offenses_by_file = Hash.new(0)

  result.offenses.each do |offense|
    file = offense.location.file
    offenses_by_file[file] += 1
  end

  if offenses_by_file.empty?
    puts 'No offenses found. All files are clean!'
  else
    min_file = offenses_by_file.min_by { |_file, count| count }
    file_path = File.relative_path(min_file[0], Dir.pwd)
    puts "The file with the least infractions is '#{file_path}' with #{min_file[1]} offense(s)."
  end
end

find_least_offended_file

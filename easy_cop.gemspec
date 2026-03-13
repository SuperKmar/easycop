Gem::Specification.new do |spec|
  spec.name          = 'easy_cop'
  spec.version       = '0.1.0'
  spec.authors       = ['SuperKmar']
  spec.email         = ['kmar.kmar@mail.ru']
  spec.summary       = 'Find the file with the least RuboCop infractions'
  spec.description   = 'EasyCop helps developers clean up their code by showing the file with the least infractions first.'
  spec.homepage      = 'https://github.com/SuperKmar/easy_cop'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb', 'bin/easy_cop', 'Gemfile', 'Gemfile.lock']
  # spec.bindir        = 'exe'
  spec.executables   = ['easy_cop']
  spec.require_paths = ['lib']
  spec.add_dependency 'rubocop', '~> 1.40'
end

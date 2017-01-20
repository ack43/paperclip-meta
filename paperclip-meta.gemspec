require "./lib/paperclip/meta/version"

Gem::Specification.new do |s|
  s.name          = "ack-paperclip-meta"
  s.version       = Paperclip::Meta::VERSION
  s.authors       = ["ack", "Alexey Bondar", "Tee Parham"]
  s.email         = ["i43ack@gmail.com", "y8@ya.ru", "tee@neighborland.com"]
  s.homepage      = "http://github.com/ack43/paperclip-meta"
  s.summary       = %q{Add width, height, and size to paperclip images}
  s.description   = %q{Add width, height and size methods to paperclip images}
  s.license       = "MIT"

  s.files         = Dir["LICENSE.txt", "README.md", "lib/**/*"]
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 2.2.2"

# <<<<<<< HEAD
#   s.add_dependency "paperclip", ">= 3.0.2", "< 6.0"
#
#   s.add_development_dependency "bundler", "~> 1.5"
#   s.add_development_dependency "rake", "~> 10.1"
#   s.add_development_dependency "mocha", "~> 1.0"
#   # s.add_development_dependency "activerecord", ">= 4.0"
#
#   # sqlite3 1.3.9 does not work with rubinius 2.2.5:
#   # https://github.com/sparklemotion/sqlite3-ruby/issues/122
#   # s.add_development_dependency "sqlite3", "1.3.8"
# =======
  s.add_dependency "paperclip", "~> 5.0"

  s.add_development_dependency "bundler", "~> 1.13"
  s.add_development_dependency "rake", "~> 11.3"
  s.add_development_dependency "mocha", "~> 1.2"
  # s.add_development_dependency "activerecord", "~> 5.0"
  # s.add_development_dependency "sqlite3", ">= 1.3.10"
  # s.add_development_dependency "delayed_paperclip", "~> 3.0"
  # s.add_development_dependency "activesupport", "~> 5.0"
  # s.add_development_dependency "activejob", "~> 5.0"
  # s.add_development_dependency "railties", "~> 5.0"
# >>>>>>> upstream/master
end

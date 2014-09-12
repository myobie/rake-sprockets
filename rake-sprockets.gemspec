# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/sprockets/version'

Gem::Specification.new do |spec|
  spec.name          = "rake-sprockets"
  spec.version       = Rake::Sprockets::VERSION
  spec.authors       = ["myobie"]
  spec.email         = ["me@nathanherald.com"]
  spec.summary       = %q{Good defaults for using sprockets through rake}
  spec.description   = %q{Build your assets with rake build.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"

  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "sprockets", "~> 2.12"
end

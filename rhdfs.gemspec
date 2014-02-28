# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rhdfs/version'

Gem::Specification.new do |spec|
  spec.name          = "rhdfs"
  spec.version       = Rhdfs::VERSION
  spec.authors       = ["lg2046"]
  spec.email         = ["lg2046@gmail.com"]
  spec.summary       = %q{hdfs ruby 客户端 基于jruby.}
  spec.description   = %q{hdfs ruby 客户端 基于jruby.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

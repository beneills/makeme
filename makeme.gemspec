# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'makeme/version'

Gem::Specification.new do |spec|
  spec.name          = "makeme"
  spec.version       = Makeme::VERSION
  spec.authors       = ["Ben Eills"]
  spec.email         = ["ben@beneills.com"]

  spec.summary       = %q{Create a new file by guessing contents from filename.}
  spec.homepage      = "https://github.com/beneills/makeme"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   << "makeme"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

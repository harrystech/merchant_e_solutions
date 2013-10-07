# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'merchant_e_solutions/version'

Gem::Specification.new do |spec|
  spec.name          = "merchant_e_solutions"
  spec.version       = MerchantESolutions::VERSION
  spec.authors       = ["Steve Ellis", "Vikram Oberoi"]
  spec.email         = ["email@steveell.is",  'voberoi@gmail.com']
  spec.description   = %q{Ruby wrapper for the Merchant e-Solutions Report API}
  spec.summary       = %q{Wrapper for the Settlement Report API}
  spec.homepage      = "http://github.com/harrystech/merchant_e_solutions"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

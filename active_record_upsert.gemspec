# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_upsert/version'

Gem::Specification.new do |spec|
  spec.name          = "active_record_upsert"
  spec.version       = ActiveRecordUpsert::VERSION
  spec.authors       = ["Jesper Josefsson"]
  spec.email         = ["jesper.josefsson@gmail.com"]

  spec.summary       = %q{PG Upsert for AR}
  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", "~> 5.0.0.beta2"
  spec.add_runtime_dependency "arel", "~>7.0"

  if defined?(JRUBY_VERSION)
    spec.platform = 'java'
    spec.add_runtime_dependency 'activerecord-jdbcpostgresql-adapter', '> 0'
  else
    spec.platform = Gem::Platform::RUBY
    spec.add_runtime_dependency 'pg', '> 0'
  end



  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

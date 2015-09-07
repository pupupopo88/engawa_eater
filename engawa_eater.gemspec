# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'engawa_eater/version'

Gem::Specification.new do |spec|
  spec.name          = "engawa_eater"
  spec.version       = EngawaEater::VERSION
  spec.authors       = ["pupupopo88"]
  spec.email         = ["39chenas@gmail.com"]

  spec.summary       = %q{Game for '炙りえんがわ' lovers}
  spec.description   = %q{When you want to eat '炙りえんがわ' , you can get a sense of satisfaction when you play this game.}
  spec.homepage      = "https://github.com/pupupopo88/engawa_eater"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_runtime_dependency "thor"
end

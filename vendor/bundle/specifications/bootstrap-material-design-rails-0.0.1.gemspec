# -*- encoding: utf-8 -*-
# stub: bootstrap-material-design-rails 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-material-design-rails"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Pablo Salgado"]
  s.date = "2015-05-11"
  s.description = "This is the rails way to add files in your project :)."
  s.email = ["pablosalgadom@gmail.com"]
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Bootstrap Material design theme for Ruby on Rails."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.0"])
  end
end

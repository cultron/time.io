# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jquery-plugins-rails"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Benedikt B\u{f6}hm"]
  s.date = "2012-06-06"
  s.description = "jQuery plugins for Rails 3.x asset pipeline"
  s.email = ["bb@xnull.de"]
  s.homepage = "https://github.com/zenops/jquery-plugins-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "jQuery plugins for Rails 3.x asset pipeline"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, ["~> 3.0"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
    else
      s.add_dependency(%q<railties>, ["~> 3.0"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, ["~> 3.0"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
  end
end

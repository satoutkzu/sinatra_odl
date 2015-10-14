# -*- encoding: utf-8 -*-
# stub: nokogiri-happymapper 0.5.9 ruby lib

Gem::Specification.new do |s|
  s.name = "nokogiri-happymapper"
  s.version = "0.5.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Damien Le Berrigaud", "John Nunemaker", "David Bolton", "Roland Swingler", "Etienne Vallette d'Osia", "Franklin Webber"]
  s.date = "2014-02-18"
  s.description = "Object to XML Mapping Library, using Nokogiri (fork from John Nunemaker's Happymapper)"
  s.email = "franklin.webber@gmail.com"
  s.extra_rdoc_files = ["README.md", "CHANGELOG.md"]
  s.files = ["CHANGELOG.md", "README.md"]
  s.homepage = "http://github.com/dam5s/happymapper"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Provides a simple way to map XML to Ruby Objects and back again."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_dependency(%q<rspec>, ["~> 2.8"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.5"])
    s.add_dependency(%q<rspec>, ["~> 2.8"])
  end
end

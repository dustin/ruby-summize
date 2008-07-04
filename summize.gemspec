Gem::Specification.new do |s|
  s.name = "summize"
  s.version = "0.1"
  s.date = "2008-07-04"
  s.summary = "Ruby client for summize."
  s.email = "dustin@spy.net"
  s.homepage = "http://github.com/dustin/summize"
  s.description = "A simple client for the summize twitter search engine"
  s.has_rdoc = true
  s.authors = ["Dustin Sallings"]
  s.files = ["README.markdown", "summize.gemspec", "lib/summize.rb"]
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["README.markdown"]
  s.add_dependency('json', '>= 1.1.2')
end

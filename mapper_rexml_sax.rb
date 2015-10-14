require 'rexml/parsers/sax2parser'
require 'rexml/sax2listener'

table = REXML::Parsers::SAX2Parser.new(File.open("table.xml"))

table.listen(:characters, ["match", "instructions"]) do |uri, localname, qname, attrs|
  puts uri
end

table.parse

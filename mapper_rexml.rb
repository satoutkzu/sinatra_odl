require "rexml/document"

table = REXML::Document.new(File.open("table.xml"))

table.elements.each("*/flow") do |flow|

  print "### match ###\n"
  flow.elements.each("match") do |match|
    match.elements.each do |match_attr|
      print "#{match_attr.name}:  #{match_attr.to_a.join(',')}\n"
    end
  end

  print "### instructions ###\n"
  flow.elements.each("instructions/instruction") do |insts|
    insts.elements.each do |inst|
      print "#{inst.name}: #{inst.to_a.join()}\n"
    end
  end

  print "### priority ###\n"
  flow.elements.each("priority") do |pri|
    print "#{pri.name}: #{pri.text}\n"
  end

  print "------\n"

end

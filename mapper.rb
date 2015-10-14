require 'happymapper'

class OutputAction
  include HappyMapper

  tag 'output-action'

  element :output_node_connector, String, :tag => 'output-node-connector'
  element :max_length, String, :tag => 'max-length'
end


class Table
  include HappyMapper

  has_many :output_actions, OutputAction, :tag => 'output-action'
end

actions = Table.parse(File.open("table.xml"))

puts "actions: #{actions}"

puts "output_actions: #{actions.output_actions}"



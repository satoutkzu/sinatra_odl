require 'happymapper'

class OutputAction
  include HappyMapper

  tag 'output-action'

  element :output_node_connector, String, :tag => 'output-node-connector'
  element :max_length, Integer, :tag => 'max-length'
end

class Action
  include HappyMapper

  tag 'action'

  element :order, Integer, :tag => 'order'
  element :output_action, OutputAction, :tag => 'output-action'
end

class ApplyAction
  include HappyMapper

  tag 'apply-actions'

  has_many :action, Action, :tag => 'action'

  def getActions
    @action.join(',')
  end

end

class Instruction
  include HappyMapper

  tag 'instruction'

  has_many :apply_action, ApplyAction, :tag => 'action'

  def getInstruction
    @apply_action.getActions.join(',')
  end

end

class Instructions
  include HappyMapper

  tag 'instructions'

  has_many :instruction, Instruction, :tag => 'instrucsion'
  
  def getInstructions
    @instruction.getInstrucsion.join(',')
  end

end

class Flow
  include HappyMapper
  
  tag 'flow'

  has_one :instructions, Instructions, :tag => 'instructions'
#  has_one :match, Match, :tag => 'match'
  element :priority, Integer, :tag => 'priority'

end

class Table
  include HappyMapper

  has_many :flow, Flow, :tag => 'flow'

end


table = Table.parse(File.open("table.xml"))

puts "actions: #{table}"

#puts "output_actions: #{table.output_actions}"


#puts "getFlows: #{table.flow.priority.toString}"

table.flow.each do |f|
  f.
end

puts "---\n"

a = table.getFlows

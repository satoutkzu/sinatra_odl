#require 'rubygems'
#require 'vendor/bundle'
#
#require 'bundler'

require 'sinatra'
require 'sinatra/reloader'

require 'json'
require 'slim'
require 'rest-client'

require 'rexml/document'

require 'happymapper'

$stdout.sync = true

class Table 
    include HappyMapper
    
    has_many :actions, 'Action', :tag => 'action'
end


get '/' do
    @title = 'Hello World!'
    @subtitle = 'Welcome to the world of sinatra and ruby.'
    erb :index
end

get "/css/application.css" do
  sass :application
end



get '/hello/*' do |name|
  "hello #{name}. how are you?"
end

get '/erb_template_page' do
  erb :erb_template_page
end

### nest step ###
get '/show' do
  article = {
      id: 1,
      title: "today's dialy",
      content: "It's a sunny day."
  }
 
  article.to_json
end
 
post '/edit' do
  body = request.body.read
 
  if body == ''
    status 400
  else
    body.to_json
  end
end


get '/slim' do
  slim :index
end


get '/slim/example' do
  slim :slimexample
end

get '/table' do
  api_result = RestClient.get 'http://admin:admin@localhost:8181/restconf/operational/opendaylight-inventory:nodes/node/openflow:4/flow-node-inventory:table/0'
  # api_result = RestClient.get 'http://api.openweathermap.org/data/2.5/weather?id=5110629&units=imperial'

  puts "test: #{api_result}"

  action = Table.parse(api_result,:single => true).actions
  
  puts "test : #{action}"

#  actions.each do |w|
#    title_tag = w[0]
#    output << "<tr><td>#{title_tag}</td>"
  
#  erb :table, :locals => {results: output}

  slim :slimexample

end

get '/table2' do
  output = ''

  api_result = RestClient.get 'http://admin:admin@localhost:8181/restconf/operational/opendaylight-inventory:nodes/node/openflow:4/flow-node-inventory:table/0'

  table = REXML::Document.new(api_result)

  table.elements.each("*/flow") do |flow|

    m = ''
    i = ''
    p = ''

    print "### match ###\n"
    flow.elements.each("match") do |match|
      match.elements.each do |match_attr|
        m = match_attr.name << ': '  << match_attr.to_a.join(',')
      end
    end

    print "### instructions ###\n"
    flow.elements.each("instructions/instruction") do |insts|
      insts.elements.each do |inst|
        i = inst.name << ': ' << inst.to_a.join()
      end
    end

    print "### priority ###\n"
    flow.elements.each("priority") do |pri|
      p = pri.name << ': ' << pri.text
    end

    output  << "<tr><td>#{m}</td><td>#{i}</td><td>#{p}</td></tr>"
  end
  
  erb :table2, :locals => {results: output}
 
end



get '/picture' do
  erb :picture
end

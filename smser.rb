require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

class Smser < Sinatra::Base

#  set :public_folder => "public", :static => true

#  get "/" do
#    erb :welcome
#  end

  get '/smser-in' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message 'Message recieved.' 
    end
    twiml.text
  end
end

require 'sinatra'
require 'twilio-ruby'

class Smser < Sinatra::Base

  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']

  Twilio.configure do |config|
    config.account_sid = account_sid
    config.auth_token = auth_token
  end

  get '/' do
    'Welcome to Expat SMS'
  end

  get '/smser-in' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message 'Message recieved.' 
    end
    twiml.text
  end

  get '/smser-send' do
    if params[:outgoing_number]
      create_client
      send_sms(@client, params[:outgoing_number])
      'Message sent? Maybe..'
    else
      'Something is not right with the world'
    end
  end

  get '/sms-quickstart' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Hey Monkey. Thanks for the message!"
    end
    twiml.text
  end

  def create_client
    @client = Twilio::REST::Client.new
  end

  def send_sms(client, outgoing_number)
    client.messages.create(
      from: '+17135742325',
      to: outgoing_number,
      body: 'Hi from Expat SMS'
    )
  end
end

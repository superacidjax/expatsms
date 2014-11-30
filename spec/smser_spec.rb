require_relative "spec_helper"
require_relative "../smser.rb"

def app
  Smser
end

describe Smser do
  it 'responds to the sms responder' do
    get '/smser-in'

    last_response.body.must_include 'Message recieved.'
  end
end

require 'spec_helper'
require "mailgun" 
require 'mailgun/exceptions/exceptions'

describe Mailgun do
  
  let(:wrapper){
    class MyModuleWrapper
      include Mailgun
    end
    MyModuleWrapper.new
  }

  it "get hello string" do
    # expect(wrapper.send_email).to eq "hello"
  end
end
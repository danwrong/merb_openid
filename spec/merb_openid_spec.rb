require File.dirname(__FILE__) + '/spec_helper'
require 'merb_openid/controller_extensions'

describe "Controller with merb_openid mixed in" do
  before(:each) do
    mock_consumer = mock('openid_consumer')
    
    mock_openid_request = mock('openid_request')
    mock_openid_request.stub!(:return_to_args).and_return({})
    mock_openid_request.stub!(:add_extension)
    mock_openid_request.stub!(:redirect_url).and_return('http://openidprovider.com')
    
    
    @controller = Class.new {
      include MerbOpenID::ControllerExtensions
      
      attr_accessor :params, :session, :mock_consumer, :mock_request
      
      def initialize
        @params, @session = {}, {}
      end
      
      def openid_consumer
        @mock_openid_consumer ||= begin 
          c = mock_consumer
          c.stub!(:begin).and_return(mock_request)
          c
        end
      end
      
      def request
        Struct.new(:protocol, :host, :uri).new('http://', 'danwebb.net', '/foreskin')
      end
      
      def redirect(url)
      end
      
    }.new
    
    @controller.mock_consumer = mock_consumer
    @controller.mock_request = mock_openid_request
  end
  
  it 'should be an OpenID request if openid_url param provided' do
    @controller.params[:openid_url] = 'aurl.com'
    
    @controller.should be_openid_request
  end
  
  it 'should be an OpenID request if open_id_complete param is provided' do
    @controller.params[:openid_complete] = '1'
    
    @controller.should be_openid_request
  end
  
  it 'should not be an openid request if openid_url is provided but its blank' do
    @controller.params[:openid_url] = '   '
    
    @controller.should_not be_openid_request
  end
  
  it 'openid_authenticate should begin a OpenID request if openid_complete is not in the params hash' do
    @controller.params[:openid_url] = 'danwebb.net'
    @controller.should_receive(:begin_openid_authentication)
    @controller.openid_authenticate
  end
  
  it 'openid_authenticate should complete a OpenID request if openid_complete is in the params hash' do
    @controller.params[:openid_complete] = '1'
    @controller.should_receive(:complete_openid_authentication)
    @controller.openid_authenticate
  end
  
  it 'should add sreg fields if fields option given' do
    @controller.params[:openid_url] = 'danwebb.net'
    
    @controller.mock_request.should_receive(:add_extension)
    
    @controller.openid_authenticate(:sreg => [:email])
  end
  
  it 'should redirect to OpenID provider' do
     @controller.params[:openid_url] = 'danwebb.net'
     
     @controller.should_receive(:redirect).with('http://openidprovider.com')
     
     @controller.openid_authenticate
  end
  
end
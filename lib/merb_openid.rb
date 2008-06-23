if defined?(Merb::Plugins)
  
  Merb::BootLoader.before_app_loads do
    dependency 'openid', '>= 2.0.0'
    Merb::Config[:merb_openid] ||= {}
  end
  
  Merb::BootLoader.after_app_loads do
    require 'merb_openid/controller_extensions'
    
    Merb::Controller.class_eval { include MerbOpenID::ControllerExtensions }
    MerbOpenID.store = (Merb::Config[:merb_openid] && Merb::Config[:merb_openid][:store]) || OpenID::Store::Memory.new
  end
  
end
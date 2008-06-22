if defined?(Merb::Plugins)
  
  Merb::BootLoader.before_app_loads do
    dependency 'openid', '>= 2.0.0'
  end
  
  Merb::BootLoader.after_app_loads do
    require 'merb_openid/controller_extensions'
  end
  
end
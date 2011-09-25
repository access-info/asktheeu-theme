class ActionController::Base
    before_filter :set_view_paths

    def set_view_paths
        path = File.join(File.dirname(__FILE__), "views")
        self.prepend_view_path(path)
        
        # XXX: Move to dispatcher?
        # Override mailer templates with theme ones. Unshifting the theme path would keep 
        # inserting the theme path again and again so we set the paths we want instead.
        ActionMailer::Base.view_paths = ActionView::Base.process_view_paths([path, 'app/views'])
    end
end

# In order to have the theme lib/ folder ahead of the main app one,
# inspired in Ruby Guides explanation: http://guides.rubyonrails.org/plugins.html
%w{ lib }.each do |dir|
  path = File.join(File.dirname(__FILE__), dir)
  $LOAD_PATH.insert(0, path)
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

# Monkey patch app code
require 'controller_patches.rb'
require 'model_patches.rb'

# Plug theme-specific locale strings
require 'gettext_setup.rb'

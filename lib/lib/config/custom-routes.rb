if ENV["RAILS_ENV"] != "test"
    ActionController::Routing::Routes.draw do |map|
        map.with_options :controller => 'help' do |help|
            help.help_about_ate '/help/about_ate', :action => 'about_ate'
            help.help_guide '/help/guide', :action => 'guide'
            help.help_right_to_know '/help/right_to_know', :action => 'right_to_know'
        end
    end
end
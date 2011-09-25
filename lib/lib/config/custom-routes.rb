if ENV["RAILS_ENV"] != "test"
    ActionController::Routing::Routes.draw do |map|
        map.with_options :controller => 'help' do |help|
            help.help_about_asktheeu '/help/about_asktheeu', :action => 'about_asktheeu'
            help.help_guide '/help/guide', :action => 'guide'
            help.help_right_to_know '/help/right_to_know', :action => 'right_to_know'
        end
    end
end
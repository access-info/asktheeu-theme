if Rails.env != "test"
    Alaveteli::Application.routes.draw do
        # Additional help pages
        match '/help/help_out' => 'help#help_out', :as => 'help_help_out'
        match '/help/right_to_know' => 'help#right_to_know', :as => 'help_right_to_know'
        
        # We want to start by showing the public bodies categories and search only
        match '/body/' => 'public_body#index', :as => "body_index"
    end
end
if Rails.env != "test"
    Alaveteli::Application.routes.draw do
        # Additional help pages
        match '/help/help_out' => 'help#help_help_out', :as => 'help_out'
        match '/help/right_to_know' => 'help#help_right_to_know', :as => 'right_to_know'
        
        # We want to start by showing the public bodies categories and search only
        match '/body/' => 'public_body#body_index', :as => "index"
    end
end
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
require 'dispatcher'
Dispatcher.to_prepare do
    # Remove UK-specific references to FOI
    InfoRequest.class_eval do
        def law_used_full
            "access to information"
        end
        def law_used_short
            "information"
        end
    end
    
    # Add intro paragraph to new request template
    OutgoingMessage.class_eval do
        def default_letter
            _("Under the right of access to documents as enshrined in Article 15 on the " +
            "Treaty on the Functioning of the EU and Article 42 of the European Charter of " +
            "Fundamental Rights, and as developed in Regulation 1049/2001, I am requesting " +
            "documents which contain the following information:\n\n")
        end
    end
    
    # Disable funcionality to let users of the site act on behalf of the public
    # body, since we aren't sure right now this is safe enough
    PublicBody.class_eval do
        def is_foi_officer?(user)
            false
        end
    end
end
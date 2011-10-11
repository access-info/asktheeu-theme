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
    
    OutgoingMessage.class_eval do
        # Add intro paragraph to new request template
        def default_letter
            return nil if self.message_type == 'followup'
            
            _("Under the right of access to documents in the EU treaties, as developed in "+
            "Regulation 1049/2001, I am requesting documents which contain the following "+
            "information:\n\n")
        end
        
        # Modify the search snippet to hide the intro paragraph.
        # XXX: Need to have locale information in the model to improve this (issue #255)
        def get_text_for_indexing
            text = self.body.strip
            text.sub!(/Dear .+,/, "")
            text.sub!(/[^\n]+1049\/2001[^:\n]+:? ?/, "") # XXX: can't be more specific without locale
            self.remove_privacy_sensitive_things!(text)
            return text
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
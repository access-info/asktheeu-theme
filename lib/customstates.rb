module InfoRequestCustomStates

    def self.included(base)
        base.extend(ClassMethods)
    end

    def theme_calculate_status
        return 'waiting_classification' if self.awaiting_description
        waiting_response = self.described_state == "waiting_response" || self.described_state == "deadline_extended"
        return self.described_state unless waiting_response
        return 'waiting_response_very_overdue' if
            Time.now.strftime("%Y-%m-%d") > self.date_very_overdue_after.strftime("%Y-%m-%d")
        return 'waiting_response_overdue' if
            Time.now.strftime("%Y-%m-%d") > self.date_response_required_by.strftime("%Y-%m-%d")
        return 'waiting_response'
    end

    # Mixin methods for InfoRequest
    module ClassMethods 
        def theme_display_status(status)
            if status == 'referred'
                _("Referred.")
            elsif status == 'transferred'
                _("Transferred.")
            else
                raise _("unknown status ") + status        
            end
        end

        def theme_extra_states
            return ['referred',
                    'transferred']
        end
    end
end

module RequestControllerCustomStates

    def theme_describe_state(info_request)
        # called after the core describe_state code.  It should
        # end by raising an error if the status is unknown
        if info_request.calculate_status == 'referred'
            flash[:notice] = _("Authority has closed your request and referred you to a different public body.")
            redirect_to unhappy_url(info_request)
        elsif info_request.calculate_status == 'transferred'
            flash[:notice] = _("Authority has transferred your request to a different public body.")
            redirect_to request_url(@info_request)
        else
            raise "unknown calculate_status " + info_request.calculate_status
        end
    end

end

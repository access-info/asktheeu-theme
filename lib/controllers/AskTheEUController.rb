# XXX: refactor into separate class 
begin
  require 'xmlsimple'
rescue LoadError
  # Debian maintainers put their xmlsimple in a different location :(
  require 'lib/xmlsimple'
end

class AskTheEUController < ApplicationController
    def frontpage
        medium_cache
        @blog_items = []
        feed_url = MySociety::Config.get('BLOG_FEED', '')
        if not feed_url.empty?
            content = open(feed_url).read
            @data = XmlSimple.xml_in(content)
            @channel = @data['channel'][0]
            @blog_items = @channel['item']
        end

        render :template => 'general/frontpage'
    end
end
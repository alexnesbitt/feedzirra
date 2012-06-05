module Feedzirra

  module Parser
    # Parser for dealing with RDF feed entries.
    class RSSFeedBurnerEntry
        include SAXMachine
        include FeedEntryUtilities

        element :title

        element :"feedburner:origLink", :as => :url
        element :link, :as => :url

        element :"dc:creator", :as => :author
        element :author, :as => :author
        element :"content:encoded", :as => :content
        element :description, :as => :summary

        element :pubDate, :as => :published
        element :pubdate, :as => :published
        element :"dc:date", :as => :published
        element :"dc:Date", :as => :published
        element :"dcterms:created", :as => :published


        element :"dcterms:modified", :as => :updated
        element :issued, :as => :published
        elements :category, :as => :categories

        element :guid, :as => :entry_id
        #add enclosure elements
        element :enclosure, :value => :length, :as => :enclosure_length
        element :enclosure, :value => :type, :as => :enclosure_type
        element :enclosure, :value => :url, :as => :enclosure_url

        def url
          @url || @link
        end
      
    end

  end

end

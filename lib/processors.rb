require 'uri'
require 'nokogiri'

def absolute_url(root, url)
  URI.parse(root).merge(URI.encode(url)).to_s
end

class Processors
  def self.add_links(site)
    site.page.links.each do |link|
      url = link.href
      if url
        if not url.starts_with? 'http:'
          url = absolute_url(site.url, url)
        end
        Site.create(:url => url)
      end
    end
  end

  def self.scrape_email_addresses(site)
    addresses = site.content.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).map {|e| e.downcase.strip}.uniq
    addresses.each do |email|
      Datum.create(:content => email, :tag => 'email',
                   :site => site)
    end
  end
end


class Crawler
  def crawl
    site = Site.where(:processed => false).first
    if site
      site.process
    else
      false
    end
  end
end

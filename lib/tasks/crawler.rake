namespace :crawler do
  desc 'initialize the crawler'
  task :start => :environment do
    crawler = Crawler.new
    crawling = crawler.crawl
    while crawling
      crawler.crawl
    end
  end
end

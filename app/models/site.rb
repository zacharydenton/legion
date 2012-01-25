require 'open-uri'
require 'mechanize'

class Site < ActiveRecord::Base
  validates_uniqueness_of :url
  has_many :data
  after_create :process

  @@processors = Processors.methods - Object.methods
  @@agent = Mechanize.new

  @page = nil
  def page
    if @page == nil
      @page = @@agent.get(self.url)
    end
    @page
  end

  @content = nil
  def content
    if @content == nil
      @content = open(self.url).read
    end
    @content
  end

  def process
    @@processors.each do |f|
      Processors.send(f, self)
    end
  end
  handle_asynchronously :process
end

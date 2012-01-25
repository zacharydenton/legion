require 'mechanize'

class Site < ActiveRecord::Base
  validates_uniqueness_of :url
  has_many :data

  @@processors = Processors.methods - Object.methods
  @@agent = Mechanize.new

  @content = nil
  def content
    if @content == nil
      @content = @@agent.get(self.url)
    end
    @content
  end

  def process
    @@processors.each do |f|
      Processors.send(f, self)
    end
  end
end

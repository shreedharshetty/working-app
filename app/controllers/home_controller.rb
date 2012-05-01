class HomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  def index
  end

  def list
    @doc = Nokogiri::XML(open("http://allevents.in/Bangalore/RSS"))
    @items = @doc.xpath('//channel/item').map do |i|
        {
        'title' => i.xpath('title').inner_text,
        'link' => i.xpath('link').inner_text,
        'description' => i.xpath('description').inner_text,
        'time' => i.xpath('timeDate').inner_text  
        }
    end
  end

  def news
    @news_doc = Nokogiri::XML(open("http://news.google.co.in/news?pz=1&cf=all&ned=in&hl=en&topic=tc&output=rss"))
    @news = @news_doc.xpath('//channel/item').map do |i|
        {
        'title' => i.xpath('title').inner_text,
        'link' => i.xpath('link').inner_text,
        'description' => i.xpath('description').inner_text,
        'pubDate' => i.xpath('pubDate').inner_text,
        'category' => i.xpath('category').inner_text
        }
    end
  end

end

require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://www.imdb.com/chart/moviemeter?ref_=nv_mv_mpm"))
   binding.pry
  end
  array
  end

  def self.scrape_profile_page(profile_url)
    file = Nokogiri::HTML(open(profile_url))
    student = {}
    file.css("div.social-icon-container a").each do |network|
      if network.attribute("href").text.include?("twitter")
        student[:twitter] = network.attribute("href").text
      elsif network.attribute("href").text.include?("linkedin")
        student[:linkedin] = network.attribute("href").text
      elsif network.attribute("href").text.include?("github")
        student[:github] = network.attribute("href").text
      else
        student[:blog] = network.attribute("href").text
      end
    end
    student[:profile_quote] = file.css("div.profile-quote").text
    student[:bio] = file.css("div.bio-content.content-holder .description-holder p").text
    student
  end

end


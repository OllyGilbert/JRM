require 'nokogiri'
require 'open-uri'

def scrape_mailonline(first_name, last_name, journo_id)
    url = "http://www.dailymail.co.uk/home/search.html?s=&authornamef=#{CGI.escape(first_name)}+#{CGI.escape(last_name)}"

    page = Nokogiri::HTML(open(url))

    stories = page.css("div.sch-res-content").map do |story|
        headline = story.css("h3 a").text
        link = "http://www.dailymail.co.uk" + story.css("h3 a").first.attributes["href"].value
        date_published = story.css("h4").text.split("-").pop.strip.split(",").shift
        published_at = story.css("h4").text.split("-").pop.strip
        summary = story.css("p.sch-res-preview").text

        story = Story.create do |story|
            story.headline = headline
            story.link = link
            story.date_published = date_published
            story.published_at = published_at
            story.summary = summary
            story.journalist_id = journo_id
        end
    end    
end

desc "Fetch mailonline stories"
task mailonline: :environment do

#run fetch mailonline stories for each mail online journalist in the database
    journalists = Journalist.joins(:positions).where("positions.publisher_id= ?", Publisher.find_by_name("mailonline").id)

    journalists.each do |journo|
        scrape_mailonline(journo.first_name, journo.last_name, journo.id)
    end
    
    #puts "#{stories.size} stories scrapped from Mail Online"

end
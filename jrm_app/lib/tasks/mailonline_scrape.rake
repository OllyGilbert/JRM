require 'nokogiri'
require 'open-uri'

def scrape_mailonline(first_name, last_name, journo_id)
    url = "http://www.dailymail.co.uk/home/search.html?s=&authornamef=#{CGI.escape(first_name)}+#{CGI.escape(last_name)}"

    page = Nokogiri::HTML(open(url))

    stories = page.css("div.sch-res-content").map do |story|
        headline = story.css("h3 a").text
        # date_published = story.css("h4").text
        summary = story.css("p.sch-res-preview").text

        story = Story.create do |story|
            story.headline = headline
            # story.date_published =
            story.summary = summary
            story.journalist_id = journo_id
        end
    end    
end

desc "Fetch mailonline journalist stories"
task mailonline: :environment do

#run fetch mailonline stories for each mail online journalist in the database
    journalists = Journalist.where(media_outlet: "mailonline")

    journalists.each do |journo|
        scrape_mailonline(journo.first_name, journo.last_name, journo.id)
    end
    
    #puts "#{stories.size} stories scrapped from Mail Online"

end
require 'nokogiri'
require 'open-uri'

def scrape_guardian(first_name, last_name, journo_id)
    url = "http://www.theguardian.com/profile/ianblack"

    page = Nokogiri::HTML(open(url))

    stories = page.css("div.trail-caption").map do |story|
        headline = story.css("div.trailtext").text
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
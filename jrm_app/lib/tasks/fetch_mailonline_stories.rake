require 'nokogiri'
require 'open-uri'


def scrape_mailonline(first_name, last_name, journo_id)
    url = "http://www.dailymail.co.uk/home/search.html?s=&authornamef=#{CGI.escape(first_name)}+#{CGI.escape(last_name)}"

    page = Nokogiri::HTML(open(url))

    stories = page.css("div.sch-res-content").map do |story|
        headline = story.css("h3 a").text

        story = Story.create do |story|
            story.headline = headline
            story.journalist_id = journo_id
        end
    end    
end

desc "Fetch mailonline journalist stories from Mail Online"
task fetch_mailonline_stories: :environment do

#run fetch mailonline stories for each mail online journalist in the database
    journalists = Journalist.where(media_outlet: "mailonline")

    journalists.each do |journo|
        scrape_mailonline(journo.first_name, journo.last_name, journo.id)
    end
    
    #puts "#{stories.size} stories scrapped from Mail Online"

end

# search box

# #controller action
# def create
#     @story = Story.new
#     @story.find_journo_stories(params[:name])        
# end

# #model
# def find_journo_stories(name)
#     the rake task
# end
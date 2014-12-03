desc "Fetch mailonline journalist stories from Mail Online"
task fetch_mailonline_stories: :environment do

    require 'nokogiri'
    require 'open-uri'
    require 'Story'

    url = "http://www.dailymail.co.uk/home/search.html?s=&authornamef=Martin+Robinson"
    page = Nokogiri::HTML(open(url))

    # page.css("sch-res-title")

    stories = page.css("div.sch-res-content").map do |story|
        headline = story.css("h3 a").text
        # puts headline

            story = Story.create do |story|
                story.headline = headline
            end
            # @story = Story.new
            # @story.headline = headline
            # @story.save 
    end

    puts "Scraped #{stories.size} stories"

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
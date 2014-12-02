desc "Fetch journalist stories"

task fetch_journalist_stories: :environment do


    require 'nokogiri'
    require 'rest-open-uri'

    require 'Story'

    url = "http://www.dailymail.co.uk/home/search.html?s=&authornamef=Martin+Robinson"
    page = Nokogiri::HTML(open(url))

    page.css("sch-res-title")

    stories = page.css("div.sch-res-content").map do |story|
      title = story.css("h3 a").text
      journalist = story.css("h4 a").text

      @story = Story.new
      @story.title = title
      @story.journalist = journalist
      @story.save 
        great!
    end


end

search box

#controller action
def create
    @story = Story.new
    @story.find_journo_stories(params[:name])        
end

#model
def find_journo_stories(name)
    the rake task
end
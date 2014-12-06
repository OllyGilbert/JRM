require 'httparty'

def get_guardian_json(first_name, last_name, journo_id)

    name = first_name.downcase + last_name.downcase

    url = "http://content.guardianapis.com/search?tag=profile%2F#{name}&show-fields=all&api-key=q2fxsghkycmyr5ffadkn8vr3"

    # url = "http://content.guardianapis.com/search?tag=profile%2F#{CGI.escape(name)}&show-fields=all&api-key=q2fxsghkycmyr5ffadkn8vr3"

    data = HTTParty.get(url)

    results = data["response"]["results"]

    stories = results.map do |story|
        headline = story["fields"]["headline"]
        link = story["webUrl"]
        summary = story["fields"]["trailText"].split(";").pop.strip
        date_published = story["fields"]["firstPublicationDate"].split("T").shift  

        story = Story.create do |story|
            story.headline = headline
            story.link = link
            story.summary = summary
            story.date_published = date_published
            story.journalist_id = journo_id
            story.publisher_id = Publisher.where(name: "guardian")[0].id
        end
    end
end

desc "Fetch guardian stories"
task guardian: :environment do

    @mailonline_journos = []

    Journalist.all.each do |journalist|
        journalist.publishers.each do |publisher|
            if publisher.name == "guardian"
                @mailonline_journos.push(journalist)
            end
        end
    end

    @mailonline_journos.each do |journo|
        get_guardian_json(journo.first_name, journo.last_name, journo.id)
    end
    
end



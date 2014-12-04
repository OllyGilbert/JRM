require 'httparty'

def get_guardian_json(first_name, last_name, journo_id)

    name = first_name.downcase + last_name.downcase

    url = "http://content.guardianapis.com/search?tag=profile%2F#{name}&show-fields=all&api-key=q2fxsghkycmyr5ffadkn8vr3"

    # url = "http://content.guardianapis.com/search?tag=profile%2F#{CGI.escape(name)}&show-fields=all&api-key=q2fxsghkycmyr5ffadkn8vr3"

    data = HTTParty.get(url)

    results = data["response"]["results"]

    stories = results.map do |story|
        headline = story["fields"]["headline"]
        summary = story["fields"]["trailText"].split(";").pop.strip
        date_published = story["fields"]["firstPublicationDate"].split("T").shift

        story = Story.create do |story|
            story.headline = headline
            story.summary = summary
            story.date_published = date_published
            story.journalist_id = journo_id
        end
    end
end

desc "Fetch guardian stories"
task guardian: :environment do

    journalists = Journalist.where(media_outlet: "guardian")

    journalists.each do |journo|
        get_guardian_json(journo.first_name, journo.last_name, journo.id)
    end
    
end



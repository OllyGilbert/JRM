# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Journo1 = Journalist.create(first_name: 'Anna', last_name: 'Hodgekiss', title: 'correspondent', media_outlet: 'mailonline', twitter: 'annahodgekiss')
Journo2 = Journalist.create(first_name: 'Lucy', last_name: 'Thackray', title: 'correspondent', media_outlet: 'mailonline', twitter: 'LucyThack')
Journo3 = Journalist.create(first_name: 'Matt', last_name: 'Chorley', title: 'correspondent', media_outlet: 'mailonline', twitter: 'MattChorley')
Journo4 = Journalist.create(first_name: 'Katie', last_name: 'Allen', title: 'correspondent', media_outlet: 'guardian', twitter: 'KatieAllenGdn')
Journo5 = Journalist.create(first_name: 'Ian', last_name: 'Black', title: 'correspondent', media_outlet: 'guardian', twitter: 'ian_black')

Position1 = Position.create(title: "Health Editor", publisher_id: 1, journalist_id: 1)
Position2 = Position.create(title: "Correspondent", publisher_id: 1, journalist_id: 2)
Position3 = Position.create(title: "Political Editor", publisher_id: 1, journalist_id: 3)
Position4 = Position.create(title: "Economics Reporter", publisher_id: 2, journalist_id: 4)
Position5 = Position.create(title: "Middle East Editor", publisher_id: 2, journalist_id: 5)

Publisher1 = Publisher.create(name: "mailonline")
Publisher2 = Publisher.create(name: "guardian")



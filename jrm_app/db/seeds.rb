# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Journo1 = Journalist.create(first_name: 'Anna', last_name: 'Hodgekiss', title: 'correspondent', media_outlet: 'mailonline', twitter: 'annahodgekiss')
Journo2 = Journalist.create(first_name: 'Lucy', last_name: 'Thackray', title: 'correspondent', media_outlet: 'mailonline', twitter: 'LucyThack')
Journo3 = Journalist.create(first_name: 'Matt', last_name: 'Chorley', title: 'correspondent', media_outlet: 'mailonline')
Journo4 = Journalist.create(first_name: 'Katie', last_name: 'Allen', title: 'correspondent', media_outlet: 'guardian')
Journo5 = Journalist.create(first_name: 'Ian', last_name: 'Black', title: 'correspondent', media_outlet: 'guardian')

Position1 = Position.create(title: "correspondent", publisher_id: 1, journalist_id: 1)
Position2 = Position.create(title: "correspondent", publisher_id: 1, journalist_id: 2)

Publisher1 = Publisher.create(name: "mailonline")
Publisher2 = Publisher.create(name: "guardian")



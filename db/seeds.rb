# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Vote.add(user_name: 'Micha', plan: 'CC um 12:15')
Vote.add(user_name: 'Heiko', plan: 'CC um 12:15')
Vote.add(user_name: 'Yasmin', plan: 'CC um 12:30')

Vote.add(user_name: 'Sam', plan: 'Royals & Rice um 12:30')
Vote.add(user_name: 'Lars', plan: 'Royals & Rice um 12:30')

Vote.add(user_name: 'Thomas', plan: 'Döner um 12:30')

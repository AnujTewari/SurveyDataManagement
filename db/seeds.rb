# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@root = User.create(:email => "root@surveybuilder.com", :password => "root1234", :password_confirmation => "root1234")
@root.admin = 2
@root.save

@admin = User.create(:email => "admin@surveybuilder.com", :password => "admin123", :password_confirmation => "admin123")
@admin.admin = 1
@admin.save

@surveytaker = User.create(:email => "user@surveybuilder.com", :password => "user1234", :password_confirmation => "user1234")
@surveytaker.admin = 0
@surveytaker.save

@s = Survey.create(:survey_name => "TV Show Survey", :surveyor_name => "Ringo", :description => "Best TV Show")
@s.save

@s = Survey.create(:survey_name => "Movie", :surveyor_name => "Django", :description => "Best Movie")
@s.save

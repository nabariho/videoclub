# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)puts 'SETTING UP DEFAULT USER LOGIN'

group = Group.create! :name => 'admin', :description => 'Usuario con todos los privilegios sobre la pagina'
group = Group.create! :name => 'base', :description => 'Usuario base, no tiene ningun tipo de bonificacion'

User.new(:username => 'admin',:email => 'admin@admin.com', :password => 'salpica', :password_confirmation => 'salpica').save

user = User.first
user.groups << Group.find_by_name('admin')
user.save

User.new(:username => 'nabar',:email => 'nabariho@gmail.com', :password => 'salpica', :password_confirmation => 'salpica').save

user = User.last
user.groups << Group.find_by_name('base')
user.save



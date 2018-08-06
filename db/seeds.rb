# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PASSWORD = "123"

User.delete_all
Project.delete_all
Team.destroy_all

super_user = User.create(
	name: "Juju",
	username: "juju",
	email: "juju@gmail.com",
	password: PASSWORD
)

10.times do 
	name = Faker::Name.first_name
	username = Faker::Dog.name

	User.create(
		name: name, 
		username: username,
		email: "#{name.downcase}.@example.com",
        password: PASSWORD
	)
end

users = User.all
puts "Created #{users.count} users"

20.times do
    Team.create(
      name: Faker::Book.genre
    )
  end

teams = Team.all
puts "Created #{teams.count} teams"

20.times do
    p = Project.create(
      title: Faker::Hacker.say_something_smart,
      description: Faker::HarryPotter.quote,
      user: users.sample
    )
end

projects = Project.all
puts "Created #{projects.count} projects"


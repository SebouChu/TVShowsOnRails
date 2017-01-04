# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Show.delete_all
User.delete_all
Comment.delete_all

user1 = User.new
user1.first_name = "Sébastien"
user1.last_name = "Gaya"
user1.email = 'admin@admin.com'
user1.password = 'adminpass123'
user1.password_confirmation = 'adminpass123'
user1.save!
user1.admin = true
user1.save

user2 = User.new
user2.first_name = "John"
user2.last_name = "Smith"
user2.email = "user@user.com"
user2.password = "userpass123"
user2.password_confirmation = "userpass123"
user2.save!

show1 = Show.create(title: "The Flash", plot: "After being struck by lightning, Barry Allen become The Flash and protects his city from meta-humans threats.", poster: File.new("#{Rails.root}/app/assets/images/the-flash.jpg"))
show2 = Show.create(title: "Marvel's Agents of S.H.I.E.L.D.", plot: "The adventures of an elite team which protects the Earth from alien threats.", poster: File.new("#{Rails.root}/app/assets/images/shield.jpg"))
show1.users << user1
show2.users << user2

comment1 = Comment.create(comment: "Ma série préférée !", user_id: user1.id, show_id: show1.id)
comment2 = Comment.create(comment: "Je vous la recommande !", user_id: user2.id, show_id: show2.id)

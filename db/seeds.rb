# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

img_url = 'https://cdn.pixabay.com/photo/2018/05/28/22/11/message-in-a-bottle-3437294__340.jpg'
rele_url = 'https://www.google.com'
avatar = 'https://i.imgur.com/6s52amk.png'
email = "blah@someemail.com"

mikey = User.create(username: "mikey", password: "blah", avatar: avatar, tagline: "it is what it is", location: "Brooklyn", gender: "male", occupation: "broke", birthday: "04/16/1992")
chris = User.create(username: "chris", password: "blah")
edwin = User.create(username: "edwin", password: "blah")

eventOne = Event.create(name: "Hamilton", description: "Come see the broadway show! 3 Tickets if ya wanna pitch in.", size: 3, location: "Broadway, New York", private: false, user: mikey, image_url: img_url, relevant_url: rele_url)
eventTwo = Event.create(name: "shindig", description: "Bae & I", size: 3, location: "Broadway, New York", private: true, user: mikey, image_url: img_url, relevant_url: rele_url)

eventThree = Event.create(name: "HBOAFM", description: "album performance", size: 99, location: "MSG", private: false, user: chris, image_url: img_url, relevant_url: rele_url)
eventFour = Event.create(name: "FORTUNE", description: "album performance", size: 5, location: "LA", private: false, user: chris, image_url: img_url, relevant_url: rele_url)
eventFive = Event.create(name: "Pokemon Tournamnent", description: "Everyone", size: 7, location: "Blah", private: false, user: mikey, image_url: img_url, relevant_url: rele_url)

eventOne.users << chris
eventThree.users << mikey
eventThree.users << edwin




puts "------------------\n|                |\n|  DONE SEEDING  |\n|                |\n------------------"

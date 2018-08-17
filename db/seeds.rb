# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
    {name: "mara", email: "mara@gmail.com", password: "mara123456"},
    {name: "laura", email: "laura@101.com", password: "laura23456"},
    {name: "dina", email: "dina@dina.com", password: "dina123456"},
    {name: "jenna", email: "jenna@101.com", password: "jenna123456"}
    ])

    parks = Park.create([
        {name: "Acadia National Park", location: "Maine", user_id: 12},
        {name: "Glacier Park", location: "Montana", user_id: 13},
        {name: "Zion National Park", location: "Utah", user_id: 14},
        {name: "Yosemite Park", location: "California", user_id: 15}
    ])
    
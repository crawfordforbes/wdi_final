# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
group1 = Group.create(name: "Group 1!")
group2 = Group.create(name: "Group 2!")

game1 = Game.create(name: "Catan", max_score: 10, group_id: group1.id)
game2 = Game.create(name: "Parcheesi", max_score: 15, group_id: group2.id)

tom = User.create(name: "Tom", email: "Tom@gmail.com", password: "asdf", games_played: 5, games_won: 2, score: 0)
tom.groups << Group.find_by_name(group1.name)
tom.groups << Group.find_by_name(group2.name)
sally = User.create(name: "Sally", email: "Sally@gmail.com", password: "1234", games_played: 8, games_won: 3, score: 0)
sally.groups << Group.find_by_name(group1.name)
charles = User.create(name: "Charles", email: "Charles@gmail.com", password: "qwerty", games_played: 2, games_won: 0, score: 0)
charles.groups << Group.find_by_name(group1.name)
charles.groups << Group.find_by_name(group2.name)

# userg1 = User_group.create(group_id: group1.id, user_id: tom.id, in_last_game: true)
# userg2 = User_group.create(group_id: group1.id, user_id: sally.id, in_last_game: true)
# userg3 = User_group.create(group_id: group1.id, user_id: charles.id, in_last_game: false)
# userg4 = User_group.create(group_id: group2.id, user_id: sally.id, in_last_game: false)
# userg5 = User_group.create(group_id: group2.id, user_id: tom.id, in_last_game: true)
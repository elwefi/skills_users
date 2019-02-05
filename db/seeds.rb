# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create SKILLS
skills = Skill.create([
  { name: 'Football' },
  { name: 'Basketball' }
])

skills += Skill.create([
  { name: 'Foot', parent: skills.first },
  { name: 'Basket', parent: skills.second },
  { name: 'Soccer', parent: skills.first }
])

# Create USERS
users = User.create([
  { name: 'user1', points: 100 },
  { name: 'user2', points: 200 },
  { name: 'user3', points: 100 },
  { name: 'user4', points: 50 },
  { name: 'user5', points: 10 },
])

# Create SKILLS_USERS
skills[0].users << users[0]
skills[0].users << users[1]
skills[2].users << users[2]
skills[1].users << users[3]
skills[4].users << users[4]
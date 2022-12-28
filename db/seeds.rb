# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"
#create 5 articles
filepath = "./movies.csv"
res = CSV.parse(File.read(filepath,:liberal_parsing => true), headers: true)
res.each_with_index do |s, ind|
  Movie.create!(
    title: s["title"],
    genre: s["genre"],
    actors: s["actors"],
    description: s["description"],
    country: s["country"]
  )
end
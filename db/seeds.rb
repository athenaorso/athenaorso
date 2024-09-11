# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# [#<Competition:0x0000017567b53ff0
# id: 1,
# name: "Testtest",
# description: "This is a test.",
# topic: "Something interesting",
# age_from: 0,
# age_to: 100,
# created_at: Thu, 08 Aug 2024 07:26:56.034694000 UTC +00:00,
# updated_at: Thu, 08 Aug 2024 07:26:56.034694000 UTC +00:00>,
# #<Competition:0x000001756877ab58
# id: 2,
# name: "Test2",
# description: "I am a test case too :)",
# topic: "Kicking dogs very far",
# age_from: 4,
# age_to: 32,
# created_at: Thu, 08 Aug 2024 07:47:29.052894000 UTC +00:00,
# updated_at: Thu, 08 Aug 2024 07:47:29.052894000 UTC +00:00>]

   ["Physik", "Mathematik", "Astronomie", "Biologie", "Chemie", "Sprachen", "MINT", "Informatik", "Gesellschaftswissenschaften", "Geschichte"].each do |tag|
     CompetitionTag.find_or_create_by!(tag: tag)
   end
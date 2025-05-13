# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.create!(
  name: "シードユーザー",
  mail: "seed@example.com",
  password: "password",
  password_confirmation: "password"
)

5.times do |i|
  user.plans.create!(
    title: "予定#{i + 1}",
    content: "これは予定#{i + 1}の内容です。",
    start_time: Time.zone.now + i.hours,
    end_time: Time.zone.now + (i + 1).hours
  )
end

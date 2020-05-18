require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: 'muhammadszuhri@gmail.com',
  name: 'Muhammad Zuhri',
  role: 'admin',
  password: 'sehat123',
  password_confirmation: 'sehat123'
)

5.times do
  Hospital.create(
    name: "#{Faker::Science.unique.scientist} Hospital",
    address: Faker::Address.full_address,
    about: Faker::Lorem.paragraph
  )
end

10.times do
  Doctor.create(
    name: Faker::Name.unique.name,
    speciality: 'General',
    about: Faker::Lorem.paragraph
  )
end

hospitals = Hospital.all
doctors = Doctor.all
hospitals.each do |hospital|
  doctors.each do |doctor|
    Schedule.create(
      hospital: hospital,
      doctor: doctor
    )
  end
end

schedules = Schedule.all
schedules.each do |schedule|
  start_time = Faker::Time.between(from: DateTime.now - 1.day, to: DateTime.now)
  ScheduleLine.create(
    schedule: schedule,
    day_of_week: Faker::Number.between(from: 0, to: 6),
    start: start_time,
    end: start_time + 3.hours
  )
end

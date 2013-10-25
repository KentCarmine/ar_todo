require 'faker'
require_relative '../app/models/task.rb'

100.times do
  Task.create(:requirement => Faker::Lorem.sentence)
end
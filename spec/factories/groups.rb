FactoryGirl.define do
  factory :group do
    group_name Faker::Team.name # Random Team Name created from random US State (Faker::Address.state) prepended to a random Team Creature
  end
end
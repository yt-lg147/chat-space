FactoryGirl.define do
  factory :message do
    body Faker::Lorem.sentence
    # image File.open("#{Rails.root}/public/apple-touch-icon.png")
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.png'))
    user
    group
  end
end
FactoryBot.define do
  factory :show do
    name { Faker::Movie.title }
    show_type { [0,1].sample }
    year { rand(1980..2024) }
    detail { Faker::Movies::Departed.quote }
  end
end

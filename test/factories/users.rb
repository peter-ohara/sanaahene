FactoryBot.define do
  factory :user, aliases: [:attendee] do
    first_name { "John" }
    last_name { "Smith" }
    other_names { "Adenuga" }
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:phone_number, 1000) { |n| "+23312345#{n}" }
  end
end

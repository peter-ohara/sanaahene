FactoryBot.define do
  factory :user, aliases: [:attendee] do
    sequence(:first_name, 5006) { |n| "John #{n}" }
    last_name { "Smith" }
    other_names { "Adenuga" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { "password" }
    sequence(:phone_number, 1000) { |n| "+23312345#{n}" }
  end
end

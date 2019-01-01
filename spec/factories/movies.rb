FactoryBot.define do
  factory :movie do
    title { "MyString" }
    resume { "MyText" }
    photo { "MyString" }
    user { nil }
  end
end

FactoryBot.define do
    factory :feedback do
        name { "Test name"}
        email {"valid-email@example.com"}
        title {"Test title"}
        message {"Test message"}
    end
end
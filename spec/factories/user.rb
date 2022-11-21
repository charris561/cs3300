#this file will use factorybot to generate a mock user for tests
FactoryBot.define do
    factory :user do
        email {"botTest@example.com"}
        password {"password"}
    end
end
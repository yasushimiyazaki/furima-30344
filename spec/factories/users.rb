FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '阿阿' }
    first_name            { '井伊' }
    last_name_kana        { 'アア' }
    first_name_kana       { 'イイ' }
    birthday              { '2000-02-20' }
  end
end

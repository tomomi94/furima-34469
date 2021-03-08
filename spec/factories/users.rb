FactoryBot.define do
  factory :user do
    nickname              {"たろう"}
    email                 {Faker::Internet.free_email}
    password              {"abc123"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_day             {"1993-10-4"}
  end
end
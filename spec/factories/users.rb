FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@com' }
    password              { '22222a' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '19300101' }
  end
end

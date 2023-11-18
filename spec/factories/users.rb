FactoryBot.define do
  factory :user do
    last_name { '山田'}
    first_name{'太郎'}
    kana_last_name{'ヤマダ'}
    kana_first_name{'タロウ'}
    email {'test@test'}
    password {'test11'}  
  end
end

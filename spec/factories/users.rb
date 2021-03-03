FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {'栗'}
    last_name {'豆'}
    first_name_kana {'クリ'}
    last_name_kana {'マメ'}
    birthday {'1993-06-05'}
  end
end
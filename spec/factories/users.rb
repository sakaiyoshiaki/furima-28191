FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }

    transient do
      person { Gimei.name }
    end
    family_name { person.first.kanji }
    personal_name { person.last.kanji }
    family_name_kana { person.first.katakana }
    personal_name_kana { person.last.katakana }
    birthday { Faker::Date.backward }
  end
end

FactoryBot.define do
  factory :item do
    id                  { 5 }
    user_id             { 5 }
    title               { 'エアフォースワン ハイカット' }
    description         { 'アメリカ旅行の際に購入しました。限定品のため日本では販売されていません。値段交渉承ります。' }
    category_id         { 3 }
    status_id           { 2 }
    shipping_charges_id { 4 }
    from_area_id        { 2 }
    deliver_leadtime_id { 5 }
    price               { '3000' }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now, to: DateTime.now) }
  end
end

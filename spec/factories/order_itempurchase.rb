FactoryBot.define do
  factory :order_itempurchase do
    postal_code           { '039-2311' }
    prefecture_id         { 2 }
    city                  { '札幌市' }
    house_number          { '１−１−１' }
    building_name         { 'レオパレスホリゾント' }
    tel                   { '08012345678' }
    token                 { 'tok_abcdefghijk00000000000000000' }
    user_id               { 1 }
    item_id               { 2 }
  end
end

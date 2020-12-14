# README
## ER図
![table](https://user-images.githubusercontent.com/67823080/102076090-88e2d080-3e4a-11eb-9dd7-2dc8daba8b7b.png)

## usersテーブル
| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false             |
| family_name        | string | null: false             |
| personal_name      | string | null: false             |
| family_name_kana   | string | null: false             |
| personal_name_kana | string | null: false             |
| birthday           | date   | null: false             |

### Association

- has_many :items, dependent: :destroy
- has_many :item_purchases, dependent: :destroy


## itemsテーブル
| Column              | Type       | Options                      |
| ------------------- | ---------- | ---------------------------- |
| title               | string     | null: false                  |
| description         | text       | null: false                  |
| category_id         | integer    | null: false                  |
| status_id           | integer    | null: false                  |
| shipping_charge_id  | integer    | null: false                  |
| from_area_id        | integer    | null: false                  |
| deliver_leadtime_id | integer    | null: false                  |
| price               | integer    | null: false                  |
| user                | references | null: false,foreign_key:true |

### Association

- belongs_to :user
- has_one    :item_purchase

## ordersテーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| postal_code         | string     | null: false                   |
| prefecture_id       | integer    | null: false                   |
| city                | string     | null: false                   |
| house_number        | string     | null: false                   |
| building_name       | string     |                               |
| tel                 | string     | null: false                   |
| item_purchases　    | references | null: false,foreign_key: true |

### Association

- belongs_to :item_purchase

## item_purchasesテーブル
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |
| item   | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

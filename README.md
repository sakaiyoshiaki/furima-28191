# README
## ER図
![table](https://user-images.githubusercontent.com/67823080/97774626-dfe35d80-1b9c-11eb-9415-d82c405b780f.png)

## userテーブル
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

- has_many :products, dependent: :destroy
- has_many :purchase_histories, dependent: :destroy


## productsテーブル
| Column              | Type       | Options                      |
| ------------------- | ---------- | ---------------------------- |
| title               | string     | null: false                  |
| description         | text       | null: false                  |
| category_id         | integer    | null: false                  |
| status_id           | integer    | null: false                  |
| shipping_charges_id | integer    | null: false                  |
| from_area_id        | integer    | null: false                  |
| deliver_leadtime_id | integer    | null: false                  |
| price               | integer    | null: false                  |
| user                | references | null: false,foreign_key:true |

### Association

- has_one    :purchase_history
- belongs_to :user

## addressテーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| postal_code         | string     | null: false                   |
| prefecture_id       | integer    | null: false                   |
| city                | string     | null: false                   |
| house_number        | string     | null: false                   |
| building_name       | string     |                               |
| tel                 | string     | null: false                   |
| purchase_history    | references | null: false,foreign_key: true |

### Association

- belongs_to :purchase_history

## purchase_historyテーブル
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| product | references | null: false,foreign_key: true |
| user    | references | null: false,foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :address

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

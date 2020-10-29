# README
## ER図
![table](https://user-images.githubusercontent.com/67823080/97528827-f4cfbd80-19f1-11eb-8872-5464359f0755.png)

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

- has_many :products
- has_many :purchase_histories


## productsテーブル
| Column              | Type       | Options                      |
| ------------------- | ---------- | ---------------------------- |
| title               | string     | null: false                  |
| description         | text       | null: false                  |
| status_id           | integer    | null: false(enum)            |
| shipping_charges_id | integer    | null: false(enum)            |
| from_area_id        | integer    | null: false(enum)            |
| deliver_leadtime_id | integer    | null: false(enum)            |
| sales_price         | integer    | null: false                  |
| user_id             | references | null: false,foreign_key:true |

### Association

- has_one    :purchase_history
- belongs_to :user
- belongs_to :category

## addressテーブル
| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| postal_code         | string     | null: false                   |
| prefecture_id       | integer    | null: false(enum)             |
| city                | string     | null: false                   |
| house_number        | string     | null: false                   |
| building_name       | string     | null: false                   |
| tel                 | string     | null: false                   |
| purchase_history_id | references | null: false,foreign_key: true |

### Association

- has_one :purchase_history

## purchase_historyテーブル
| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| products_id | references | null: false,foreign_key: true |
| user_id     | references | null: false,foreign_key: true |
| address_id  | references | null: false,foreign_key: true |

### Association

- belongs_to :products
- belongs_to :user
- belongs_to :address

## categoryテーブル
| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| name        | string     | null: false                   |
| products_id | references | null: false,foreign_key: true |

### Association

- has_many :products

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

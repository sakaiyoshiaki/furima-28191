# README

## userテーブル
| Column             | Type    | Options                                                                               |
| ------------------ | ------- | ------------------------------------------------------------------------------------- |
| nickname           | string  | null: false                                                                           |
| email              | string  | null: false,unique:true,format: {with: /\A[\w+-.]+@[a-z\d-.]+.[a-z]+\z/i}             |
| password           | string  | null: false,length: {minimum: 6},format:(with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i) |
| password_confirm   | string  | null: false                                                                           |
| family_name        | string  | null: false,format:{with:/\A[ぁ-んァ-ン一-龥]+\z/}                                      |
| personal_name      | string  | null: false,format:{with:/\A[ぁ-んァ-ン一-龥]+\z/}                                      |
| family_name_kana   | string  | null: false,format:{with:/\A[ぁ-んァ-ン一-龥]+\z/}                                      |
| personal_name_kana | string  | null: false,format:{with:/\A[ぁ-んァ-ン一-龥]+\z/}                                      |
| birth_year         | integer | null: false(enum)                                                                     |
| birth_month        | integer | null: false(enum)                                                                     |
| birth_day          | integer | null: false(enum)                                                                     |

### Association

- has_many :products
- has_many :purchase_history
- has_one  :address
- has_one  :cards

## productsテーブル
| Column              | Type    | Options                                                        |
| ------------------- | ------- | -------------------------------------------------------------- |
| product_title       | string  | null: false,length: { maximum: 40 }                            |
| product_description | text    | null: false,length: { maximum: 1,000 }                         |
| product_status      | integer | null: false(enum)                                              |
| shipping_charges    | integer | null: false(enum)                                              |
| from_area           | integer | null: false(enum)                                              |
| deliver_leadtime    | integer | null: false(enum)                                              |
| sales_price         | integer | null: false,format:(with:/\A(?=.?[a-z])(?=.?[\d])[a-z\d]+\z/i) |

### Association

- has_many   :product_images
- has_one    :purchase_history
- belongs_to :user

## addressテーブル
| Column        | Type    | Options                                       |
| ------------- | ------- | --------------------------------------------  |
| postal_code   | integer | null: false,format:{with:/\A\d{3}[_]\d{4}\z/} |
| prefecture_id | string  | null: false、foreign_key: true                 |
| city          | string  | null: false                                   |
| address       | string  | null: false                                   |
| building      | string  | null: false                                   |
| tel           | integer | null: false,length: {minimum: 11}             |
| user_id       | integer | null: false,foreign_key: true                 |

### Association

- belongs_to :user

## cardsテーブル
| Column      | Type    | Options           |
| ----------- | ------- | ----------------- |
| user_id     | integer | foreign_key: true |
| card_id     | string  | null: false       |
| customer_id | string  | null: false       |

### Association

- belongs_to :user

## product_imagesテーブル
| Column     | Type    | Options           |
| ---------- | ------- | ----------------- |
| product_id | integer | foreign_key: true |
| name       | string  | null: false       |

### Association

- belongs_to :products

## purchase_historyテーブル
| Column      | Type    | Options                       |
| ----------- | ------- | ----------------------------- |
| products_id | Integer | null: false,foreign_key:true  |
| user_id     | Integer | null: false,foreign_key: true |

### Association

- belongs_to :products
- belongs_to :user


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

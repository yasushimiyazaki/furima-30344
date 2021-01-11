# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :buys

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item_name                           | string     | null: false       |
| item_info                           | text       | null: false       |
| item_category                       | string     | null: false       |
| item_sales_status                   | string     | null: false       |
| ite,_sipping_fee_status             | string     | null: false       |
| item_prefecture                     | string     | null: false       |
| item_scheduled_delivery             | string     | null: false       |
| item_price                          | integer    | null: false       |
| add_tax_price                       | integer    | null: false       |
| profit                              | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy

## buys table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| card_number                         | integer    | null: false       |
| card_expiration_month               | integer    | null: false       |
| card_expiration_year                | integer    | null: false       |
| card_cvc                            | integer    | null: false       |
| user                                | string     | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : buy_address

## buy_addresses table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| card_number                         | integer    | null: false       |
| card_expiration_month               | integer    | null: false       |
| card_expiration_year                | integer    | null: false       |
| card_cvc                            | integer    | null: false       |
| user                                | string     | foreign_key: true |

### Association

- belongs_to :buy

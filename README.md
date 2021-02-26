#テーブル設計

## users テーブル

|Column                  |Type       |Options           |
|----------------------- |---------- |----------------- |
| nickname               | string    |  null: false     |
| email                  | string    |  null: false     |
| password               | string    |  null: false     |
| passwordconfirmation   | string    |  null: false     |
| firstname              | string    |  null: false     |
| lastname               | string    |  null: false     |
| kanafirstname          | string    |  null: false     |
| kanalastname           | string    |  null: false     |
| year                   | string    |  null: false     |
| month                  | string    |  null: false     |
| day                    | string    |  null: false     |


### Association
has_many :products
has_many :parchases


## products テーブル
|Column        |Type                  |Options                         |
|--------------|----------------------|------------------------------- |
| seller       | references           | null: false, foreign_key: true |
| image        | ActiveStorageで実装   | ActiveStorageで実装             |
| productname  | string               |  null: false                   |
| description  | text                 |  null: false                   |
| category     | string               |  null: false                   |
| status       | string               |  null: false                   |
| burden       | string               |  null: false                   |
| days         | string               |  null: false                   |
| year         | string               |  null: false                   |
| price        | string               |  null: false                   |


### Association
belongs_to :user
has_one :parchases


## parchases テーブル
|Column           |Type                  |Options      |
|-----------------|----------------------|-------------|
| who             | string               | null: false |
| purchase        | string               | null: false |


### Association
belongs_to :user
belongs_to :products
has_one :shippings


## shippings テーブル
|Column        |Type                  |Options       |
|--------------|----------------------|------------- |
| prefectures  | string               | null: false  |
| postalcode   | string               | null: false  |
| municipality | string               | null: false  |
| addres       | string               | null: false  |
| building     | string               | null: false  |
| phonenumber  | string               | null: false  |

### Association
belongs_to :parchases

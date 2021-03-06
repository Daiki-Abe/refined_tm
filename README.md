## :wrench: アプリ名
「Refind_TM」

## :globe_with_meridians: URL
http://18.176.91.246:3000

## :key: 採用ご担当者様のアカウント
メールアドレス：「saiyou4444@gmail.com」<br>
パスワード：「saiyou4444」

## :scroll: アプリ概要
ストップウォッチで活動時間を管理することができます。<br>
①何のための時間にするのか ②なぜそのアクションをするのか ③目標の時間<br>
を宣言した上で、ストップウォッチで活動時間を計ることができます。<br>
宣言したアクションが終了したらストップウォッチを止めて、宣言した内容と時間を全て記録することができます。<br>
<br>
全てのアクションに対して、何故するのかという宣言をすることや時間計測をすることで、<br>
１日における時間の使い方を意識して、生産性や効率を向上させることができます。<br>
<br>
また、時間を計測時に、歴史上の偉人たちの時間に対する考え方をスライドショーで観ることができるようになっています。

## :thought_balloon: アプリ開発の背景（意図）
仕事に従事しながらプログラミング学習を継続するためには、時間の使い方や管理が重要でした。<br>
できるだけ無駄な時間は過ごさないという時間に対する意識が変わり、<br>
[Twitter](https://twitter.com/abeeeee_d)で日々の学習記録として1日の過ごし方をツイートしていました。<br>
そこで、1日の時間の使い方を意識させたり、時間を管理・記録することができるアプリを開発したいと考えました。

## :computer: デモ
<image src = "https://user-images.githubusercontent.com/58421780/81024283-f2126680-8ead-11ea-8f64-801543ab9521.gif">

### :art: 使用技術
- 「Ruby on Rails」でアプリ製作
- 「Docker」で開発環境を構築
- 「devise」でユーザー機能を実装
- 「RuboCop」で静的コード解析テスト
- 「RSpec」で単体テストと統合テスト
- 「AWS（EC2）」でデプロイ

## :memo: 課題と今後実装したい機能
- twitterのAPIを活用してログインできるようにしたい。
- EC2 → ECSを使用したい。

## :triangular_ruler: DB設計
### users(devise)テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|

### Association
- has_many :declarations, dependent: :destroy

### declarationsテーブル
|Column|Type|Options|
|------|----|-------|
|what|string|null: false|
|why|string|null: false|
|time|string|null: false|
|score|string|null: false|
|start|string|null: false|
|end|string|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user

## :octocat: 製作者
- [Qiita](https://qiita.com/Daiki-Abe)
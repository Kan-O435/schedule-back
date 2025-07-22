スケジュール共有アプリ
概要
このアプリは、ユーザーが予定を作成し、他のユーザーと予定を共有できるスケジュール管理アプリです。
シンプルで直感的に予定管理ができることを目指しています。

主な機能
ユーザー登録とプロフィール表示

予定の作成、閲覧、編集、削除

他のユーザーとの予定共有および共有解除

APIドキュメント閲覧（Swagger UI）

技術スタック
Ruby on Rails 7.1

PostgreSQL（開発環境によってはSQLite）

RSpec（テストフレームワーク）

FactoryBot（テスト用データ作成）

Rswag（APIドキュメント生成）

動作環境・前提条件
Ruby 3.2.3

Bundler

PostgreSQL または SQLite

セットアップ手順
リポジトリをクローンしてプロジェクトディレクトリに移動

bash
コピーする
編集する
git clone [https://github.com/Kan-O435/schedule-back.git]
cd schedule-back
Bundlerで必要なGemをインストール

bash
コピーする
編集する
bundle install
データベースの作成・マイグレーションを実行

bash
コピーする
編集する
rails db:create
rails db:migrate
（任意）テストデータの投入

bash
コピーする
編集する
rails db:seed
ローカルサーバーを起動

bash
コピーする
編集する
rails server
ブラウザで http://localhost:3000 にアクセス

APIエンドポイント一覧
メソッド	パス	説明
POST	/users	ユーザー登録
GET	/users/:id	ユーザー情報取得
GET	/users/:user_id/plans	ユーザーの予定一覧取得
POST	/users/:user_id/plans	予定作成
PUT	/users/:user_id/plans/:id	予定更新
DELETE	/users/:user_id/plans/:id	予定削除
POST	/share_plans	予定共有
DELETE	/share_plans	共有解除
GET	/api-docs	Swagger APIドキュメント

テスト実行方法
RSpecでテストを実行します。

bash
コピーする
編集する
bundle exec rspec
すべてのテストがパスすることを確認してください。

認証について
Firebase認証を利用しています（本番環境向け）。

テスト環境では認証をスキップする設定を行っています。

今後の拡張予定
予定の通知機能

共有範囲（公開範囲）の詳細設定

UIの改善

開発者情報
作成者: [菅]
# スケジュール共有アプリ

## 概要

このアプリは、ユーザーが予定を作成し、他のユーザーと予定を共有できるスケジュール管理アプリです。  
シンプルで直感的に予定管理ができることを目指しています。

## 主な機能

- ユーザー登録とプロフィール表示
- 予定の作成、閲覧、編集、削除
- 他のユーザーとの予定共有および共有解除
- APIドキュメント閲覧（Swagger UI）

- ![Uploading Videotogif (1).gif…]()


## 技術スタック

- Ruby on Rails 7.1
- PostgreSQL（開発環境によってはSQLite）
- RSpec（テストフレームワーク）
- FactoryBot（テスト用データ作成）
- Rswag（APIドキュメント生成）

## 動作環境・前提条件

- Ruby 3.2.3
- Bundler
- PostgreSQL または SQLite

---

## セットアップ手順

1. リポジトリをクローンしてプロジェクトディレクトリに移動

```bash
git clone https://github.com/Kan-O435/schedule-back.git
cd schedule-back
```

セットアップ手順
このリポジトリをクローンし、プロジェクトディレクトリに移動します。

2. 必要なGemをインストール

```bash
bundle install
```

3. データベースの作成とマイグレーションを実行します。
```bash
rails db:create
rails db:migrate
```

4. 必要であれば、初期データの投入を行います。

```bash
rails db:seed
```

5. 開発用のローカルサーバーを起動します。

```bash
rails server
```

6. ブラウザで以下の URL にアクセスします

```bash
http://localhost:3000
```

##APIエンドポイント一覧
| メソッド   | パス                          | 説明                    |
| ------ | --------------------------- | --------------------- |
| POST   | `/users`                    | ユーザー登録                |
| GET    | `/users/:id`                | ユーザー情報取得              |
| GET    | `/users/:user_id/plans`     | ユーザーの予定一覧取得           |
| POST   | `/users/:user_id/plans`     | 予定作成                  |
| PUT    | `/users/:user_id/plans/:id` | 予定更新                  |
| DELETE | `/users/:user_id/plans/:id` | 予定削除                  |
| POST   | `/share_plans`              | 他ユーザーに予定を共有           |
| DELETE | `/share_plans`              | 予定の共有を解除              |
| GET    | `/api-docs`                 | SwaggerによるAPIドキュメント閲覧 |

## テストの実行方法
RSpecを使ってテストを実行できます。
```bash
bundle exec rspec
```
エラーがないことを確認してください。

## 認証について
- このアプリではFirebase認証を導入しています。
- **本番環境**では、GoogleのFirebaseトークンを検証してログイン処理を行っています。
- **テスト環境**では、authenticate_user! をスキップしており、認証がなくてもテストを通せるようにしています。

## 今後の拡張予定
- 通知機能の追加（例：予定開始前のリマインダー）
- 共有範囲の細かい設定（例：閲覧専用か編集権限ありか）
- UIの改善（カレンダー形式での表示、スマホ最適化

開発者情報
作成者: 菅（Kan）

GitHub: https://github.com/Kan-O435

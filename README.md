# 業務管理システム

- Ruby on Railsで作成するシンプルなシステムです。<br>
- 企業の従業員のワークロードを監視するためのソリューションです- 

## 目次

- [概要](#概要)
  - [ワークフロー](#ワークフロー)
  - [スクリーンショット](#スクリーンショット)
  - [リンク](#リンク)
- [構造](#構造)
  - [開発環境・ツール](#a-開発環境ツール)
  - [ｺｰﾄﾞﾌｧｲﾙ構造・定義](#b-ｺｰﾄﾞﾌｧｲﾙ構造定義)
  - [継続的な開発](#c-継続的な開発)
- [著者](#d-著者)


## 概要
[目次](#目次)

### ワークフロー
<image style="width:300px;height:150px" src="./documents/flow.png" />

### リンク
  以下のリンクは、デモンストレーションのために heroku にアップロードされたシステムです。<br>
  URL: [My Ruby andn Rails ライブサイト](https://rubyonrails-project.herokuapp.com/jobs)

## 構造
[目次](#目次)
### a 開発環境ツール

- [PostgreSQL](https://www.postgresql.org/) - Database
- [Rails API](https://api.rubyonrails.org/) - database-backed web applications


### b ｺｰﾄﾞﾌｧｲﾙ構造定義
[目次](#目次)

### Login・Logout・Register機能 (Devise User Management)
  - use devise of gems the third party tool (https://rubygems.org)
  - add `gem 'devise'` into the Gemfile
  - run `bundle install`
  - run `rails generate devise:install` 
  - set up the default URL options for the Devise mailer in development and production environment
    add the line in them `config.action_mailer.default_url_options = { host: 'localhost', port: 3000}`
  - add flash messages in app/views/layouts/application.html
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
  - set up views for the devise via running `rails g devise:views`
  - create a model for it `rails g devise modelName` to create the devise table in the database
  - run `rails db:migrate`
  - check your routes `rails routes`
  - and add the routes into your navbar
    ```rubygems
	<%= link_to "Sign Up", new_user_registration_path, class:"nav-link" %>
	<%= link_to "Login", new_user_session_path, class:"nav-link" %>
	<%= button_to 'Sign Out', destroy_user_session_path, method: :delete, class:"dropdown-item" %>
	<%= link_to '編集', edit_user_registration_path, class:"dropdown-item" %>
    ```	
  


### 1. DB作成
  - jobsデータベース テーブルを作成する : `rails g scaffold jobs department:string, job:string, duedate:string, status:string`
  
  
### 2. Backend　フォルダ構造 

### 3. Frontend　フォルダ構造 

### 4. Deploy　配備 
[目次](#目次)

  - git push heroku master 
  - heroku run rake db:migrate 
	
### c 継続的な開発
[目次](#目次)


## d 著者

- Website - [BRUCE LIM](https://potatoscript.github.io/resume/)

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
<image style="width:300px;height:150px" src="./document/workflow.png" />

### スクリーンショット
<table>
<tr>
<td>DEMO</td>
<td><image style="width:300px;height:150px" src="./document/demo.gif" /></td>
</tr>
<tr>
<td>PC表示</td>
<td><image style="width:300px;height:150px" src="./document/screenshot.png" /></td>
</tr>
<tr>
<td>スマートフォン表示</td>
<td><image style="width:200px;height:250px" src="./document/screenshot3.png" /></td>
</tr>
</table>

### リンク
  以下のリンクは、デモンストレーションのために github にアップロードされた [Front End] システムのみです。<br>
  URL: [Frontend ライブサイト](https://potatoscript.github.io/arentinc-production/)

## 構造
[目次](#目次)
### a 開発環境ツール

- [PostgreSQL](https://www.postgresql.org/) - Database
- [ASP.NET CORE API](https://docs.microsoft.com/en-us/aspnet/core/?view=aspnetcore-6.0) - Back End development framework in c#
- [Vue.js](https://vuejs.org/) - Front End development library with [cli](https://cli.vuejs.org/) framework
- [AXIOS](https://axios-http.com/docs/intro) - ブラウザから XMLHttpRequest を作成する
- [Boostrap.js](https://getbootstrap.com/) - css スタイリング ライブラリ
- [Chart.js](https://chartjs.org/) - JavaScript charting ライブラリ


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
  


### 1. DB定義
  - [Employeesテーブル](./document/Employees.sql) - 従業員マスターテーブルデータDDL
  - [Jobsテーブル](./document/Jobs.sql) - 業務テーブルデータDDL
  
### 2. Backend　フォルダ構造 
  - [dist](./arentinc-api/dist) - デプロイされたファイルの場所<br>
  - [Startup.cs](./arentinc-api/Startup.cs) - Get the connectionString of the database from `appsettings.json`
  - [appsettings.json](./arentinc-api/appsettings.json) - Set the connectionSgring of the database
  - Controllers - Frontendの入口 <br>
    |- [EmployeeConroller.cs](./arentinc-api/Controllers/EmployeeController.cs) - 従業員マスターデータhttp リクエスト→EmployeeServices.cs <br>
    |- [JobController.cs](./arentinc-api/Controllers/JobController.cs) - 業務データhttp リクエスト→JobServices.cs <br>
  - Models<br>
    |- [DBContext.cs](./arentinc-api/Models/DBContext.cs) -　データベーステーブル名定義 <br>
    |- [Employee.cs](./arentinc-api/Models/Employee.cs) - 従業員データベーステーブル項目定義 <br> 
    |- [Job.cs](./arentinc-api/Models/Job.cs) - 業務データベーステーブル項目定義 <br>
  - Services <br>
    |- [DataBaseServices.cs](./arentinc-api/Services/DataBaseServices.cs) - データベース接続設定クラス <br>
    |- [EmployeeServices.cs](./arentinc-api/Services/EmployeeServices.cs) - 従業員ＳＱＬクエリ作成クラス <br>
    |- [JobServices.cs](./arentinc-api/Services/JobServices.cs) - 業務ＳＱＬクエリ作成クラス <br>
	
### 3. Frontend　フォルダ構造 
  - [dist](./arentinc-ui/dist) - デプロイされたファイルの場所<br>
  - assets<br>
     |- js - [url.js](./arentinc-ui/src/assets/js/url.js) - BackendのURLを設定する `API_URL: "https://localhost:44306/api/"` <br>
	 |- [dummy.json](./arentinc-ui/src/assets/dummy.json) - Backendの接続なし時のダミーデータ (デモンストレーション用) <br>
  - locales<br>
	 |- [ja.json](./arentinc-ui/src/locales/ja.json) - 各漢字変数設定 <br>
  - router<br>
     |- [index.js](./arentinc-ui/src/router/index.js) - タブールート設定<br>
  - views<br>
     |- [EmployeeView.vue](./arentinc-ui/src/views/EmployeeView.vue) - 従業員マスター表示画面 <br>
     |- [JobView.vue](./arentinc-ui/src/views/JobView.vue) - 業務一覧表示画面 <br>	 
	 |- [InputModalView.vue](./arentinc-ui/src/views/InputModalView.vue) - 共通データ登録表示画面 `prop` `$emit` `<slot>` <br>	 
  - [App.vue](./arentinc-ui/src/App.vue) - Main画面 <br>  
  - [main.js](./arentinc-ui/src/main.js) - 共通library設定箇所 

### 4. Deploy　配備 
[目次](#目次)

  - FrontendをgitHubに配備する設定箇所：
    - [deploy.sh](./arentinc-ui/deploy.sh)
    - [package.json](./arentinc-ui/package.json) - `"deploy": "sh deploy.sh"`
    - [vue.config.js](./arentinc-ui/vue.config.js) - `publicPath : '/arentinc-production/'`

  - BackendをDocker Imageを作成する設定箇所：  
	- [Dockerfile](./arentinc-api/Dockerfile) <br>
	   `docker build -t <Ddocker Hub ID>/<Project Name>:<Version> .`
	
### c 継続的な開発
[目次](#目次)

- 今後の課題：
   - PC・スマートフォン表示の調整改善
   - Uncaught (in promise) RangeError: Maximum call stack size exceeded 
- 今後検証付きのログインページを作成する（Login・Logout・Register機能追加）


## d 著者

- Website - [BRUCE LIM](https://potatoscript.github.io/resume/)



# README

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

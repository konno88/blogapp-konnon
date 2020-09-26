![Ruby](https://img.shields.io/badge/Ruby%20-2.6.5p114-red) ![Rails](https://img.shields.io/badge/Rails%20-6.0.3.2-important)

# Go-channel

## What is the Go-channel?

Go-channel is a matching app that supports people who like songs and musical instruments to play together.

![Readme1](https://user-images.githubusercontent.com/68778872/92993481-dd656f80-f52c-11ea-8240-b41e1d77289c.png)

## Features

### Implemented function

* Posting an article.

* Add comments to articles.

* Like the article.

* User follow.

* User search.

* One-on-one chat.

### Gem file used

```bash
gem 'pg', '>= 0.18', '< 2.0'
gem 'faker'
gem 'hamlit'
gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'aws-sdk-s3'
gem 'image_processing', '~> 1.2'
gem 'dotenv-rails'
gem 'rspec-rails'
gem 'factory_bot_rails'
gem 'erb2haml'
```

## Usage

1. First, press the login button and enter your email and password to create a new account. If you press the "sign up" button and the button at the bottom of the screen switches to "ログアウト", you are successful.

2. Once you are logged in, create a profile. You can create a profile by pressing "プロフィール" from the menu bar at the top right of the screen and clicking "変更".

3. Once you have a profile, feel free to use it. You can also post articles, search for users who have the same instrument as a hobby, follow them, chat, and interact with them.

## Note

### Precautions when using chat.

When you follow each other for the first time, the character 'チャットを始める' will appear. Please load at that time just incase.

## Author 

Go konno


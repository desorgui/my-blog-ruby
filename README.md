# My blog Ruby
> The Blog app is a classic example of a blog website. It's a functional website that shows the list of posts and empower readers to interact with them by adding comments and liking posts. 

## 🛠️ Built With

- Ruby on Rails
- Css

## 🧮 Prerequisites

### Install
- Node.js
- npm
- Ruby
- Rails

### Setup

Follow these steps on your console to properly clone this repository on your desktop:

```
$ cd desktop
$ git clone https://github.com/desorgui/my-blog-ruby.git
$ cd 'my-blog-ruby'
$ code .
Run 'ruby file_name' to see outputs in the console.
Run 'rubocop' to check linter offenses.
```

Create database for the project with `bin/rails db:create`, otherwise create databases manually in PostgreSQL.

If necessary, add username and password in `config/database.yml` for development and test:
```
development:
  <<: *default
  database: Blog_app_development
  host: ''
  username:
  password:
  
  test:
  <<: *default
  database: Blog_app_test
  username:
  password:
```

Install all gems `bundle install`

Set up RSpec in your app and create the Spec folder `rails g rspec:install`

Run the migration into your testing environment `rails db:migrate RAILS_ENV=test`

Run all tests with description `rspec spec --format documentation`

## 👤 Author

### Guishny DESOR

- GitHub: [@desorgui](https://github.com/desorgui)
- Twitter: [@DGuishny](https://twitter.com/DGuishny)
- LinkedIn: [Guishny Desor](https://www.linkedin.com/in/guishny-desor-5421a01a9/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/desorgui/my-blog-ruby/issues).

## ⭐️ Show your support

Give a ⭐️ if you like this project!

## 📝 License

[MIT License](./LICENCE.md)

# Search Engine
This is a realtime search engine that shows what people searched for the most.

## Notes
  In this project I created a realtime search with analysis of most searched items. I separated user data by getting visitors' user agent so that users data are not mixed up.In this regard, the user is anonymous. I proposed way to sign in and sign up to associate users to the database(Not implemeted yet). In the background , I implemented  active jobs to create and manage analytics .For realtime scalabillty, I propose redis with active jobs. Since heroku has ended free tier , I deployed to render.

## Live Link
[Live Link]()

## Built With

- Ruby on Rails
- Postgresql
- stimulus Js


## Getting Started

To get a local copy up and running follow these simple example steps.

- git clone https://github.com/assadounto/search-engine

- cd search-engine


### Prerequisites
To start please have the following running
- Ruby
- Rails
- PostgresSQL


### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
rails db:create
rails db:migrate
```

Start server with:

```
rails server
```

Open ```http://localhost:3000/``` in your browser.


### Run tests

Install npm with:

```
npm i
```

Install rspec with:

```
bundle install
```

and

```
rails generate rspec:install
```

run the test with:

```
rspec spec
```



## Author

👤 **Rich Adu**

- GitHub: [@assadounto](https://github.com/assadounto)
- Twitter: [@adukyerer](https://twitter.com/adukyerer)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/assadounto/budget-app/search-engine).


## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

- Credits go to Emil and rest of team at [HelpJuice](https://www.Helpjuice.com)


## 📝 License

This project is [MIT](./LICENCE) licensed.
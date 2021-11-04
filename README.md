# Tea Time

![Image](https://media.giphy.com/media/WQMgnHWQdyZjO/giphy.gif)  
[via GIPHY](https://media.giphy.com/media/WQMgnHWQdyZjO/giphy.gif)

### A Rails API for a fictional Tea Subscription Service.

#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Testing
<p>
<img src="https://img.shields.io/badge/rspec-16B7FB.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

#### Tools
<p>  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
</p>

### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Set up the database: `rails db:{drop,create,migrate,seed}`

Find the [project spec here](https://mod4.turing.edu/projects/take_home/take_home_be)

### [Schema Design](https://dbdiagram.io)

<p align="center">
  <img src="https://user-images.githubusercontent.com/75275648/140257190-0e5585ec-f92d-4cde-ab19-bbf7de37a447.png"/>
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

### Endpoints
#### Create a tea subscription for a customer

| Method   | URI                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `POST`    | `/api/v1/customers/:customer_id/subsricptions`| Creates a customer subscription in the database and returns the subscription attributes |

##### Example:  
```
{
    "data": {
        "id": "9",
        "type": "subscription",
        "attributes": {
            "title": "Sun Moon Lake",
            "price": 24.99,
            "status": "active",
            "frequency": "biannually",
            "customer_id": 5,
            "tea_id": 5
        }
    }
}
```

#### Cancel a customer’s tea subscription

| Method   | URI                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `PATCH`    | `/api/v1//customers/:customer_id/subscriptions/:id`| Cancels a customer subscription in the database and returns subscription attributes with the updated status |

##### Example:  
```
{
    "data": {
        "id": "8",
        "type": "subscription",
        "attributes": {
            "title": "Sun Moon Lake",
            "price": 24.99,
            "status": "cancelled",
            "frequency": "biannually",
            "customer_id": 5,
            "tea_id": 5
        }
    }
}
```

#### View all of a customer’s subsciptions, of active and cancelled status

| Method   | URI                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1//customers/:customer_id/subscriptions`| Returns all tea subscriptions for a given customer |

##### Example:  
```
{

}
```

#### <ins>Project Configurations</ins>

* Ruby Version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System Dependencies](https://github.com/JoannaCoPo/tea-time/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 6.1.4
    ```

* Database Creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'tea_time_development'
    Created database 'tea_time_test'
    ```
    
* How to run the test suite:
    ```bash
    $ bundle exec rspec -fd
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
  => Booting Puma
  => Rails 5.2.6 application starting in development
  => Run `rails server -h` for more startup options
  Puma starting in single mode...
  * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
  * Min threads: 5, max threads: 5
  * Environment: development
  * Listening on tcp://localhost:3000
  Use Ctrl-C to stop
    ```

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

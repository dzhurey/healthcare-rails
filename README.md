# README

## Requirement

- Ruby 2.6.4
- Postgresql

## Installation

1. Clone this repository

2. install dependency

```
bundle install
```

3. create `.env` file follow on example `.env.example`

4. setup database

```
rails db:create
rails db:migrate
rails db:seed
```

5. run rails server

```
rails s
```

## Operation

1. You can access admin dashboard by login with credentials

```
email: muhammadszuhri@gmail.com
password: sehat123
```

2. As admin you can CRUD doctor, hospital, schedule and schedule line

3. As admin you can see booking list in a week

4. You can sign up as a user by click `sign up` button on `login` page.

5. As user you can see hospital list and doctor list, you can book doctor on the following schedule
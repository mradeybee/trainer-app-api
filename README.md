# Trainer APP API

# End Points Functionalities

|       End Point        |                  Body Payload                  |       Description       | Require Auth Token |
| :--------------------: | :--------------------------------------------: | :---------------------: | :----------------: |
|    **POST /users/**    | email, password, firstname, lastname, username |   Create User/Sign Up   |       false        |
|  **POST /auth/login**  |                email, password                 |       Login user        |       false        |
| **POST /auth/logout**  |                 referesh_token                 |      Log out user       |        true        |
| **POST /auth/refresh** |                 referesh_token                 | Refresh user auth token |        true        |

---

# Running The Application

- Clone or download the repo

```
git clone git@github.com:Temanconsult/trainer-app-api.git
```

- Navigate to the app directory

```
cd trainer-app-api
```

- Bundle dependencies

```
bundle install
```

- Run Database setup

```
rails db:create && rails db:migrate
```

- Setup environment variables

```
export SECRET='<A SECRETE TOKEN>'
```

- Start the application

```
rails server
```

---

# Running Tests

The tests are run using RSpec.

```
rspec
```

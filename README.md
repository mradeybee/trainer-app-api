# Trainer APP API

# End Points Functionalities

|             End Point             |                  Body Payload                  |       Description       | Require Auth Token |
| :-------------------------------: | :--------------------------------------------: | :---------------------: | :----------------: |
|         **POST /users/**          | email, password, firstname, lastname, username |   Create User/Sign Up   |       false        |
|       **POST /auth/login**        |                email, password                 |       Login user        |       false        |
|       **POST /auth/logout**       |                 referesh_token                 |      Log out user       |        true        |
|      **POST /auth/refresh**       |                 referesh_token                 | Refresh user auth token |        true        |
| **PATCH /email_confirmation/:id** |                                                |   confirms user emil    |       false        |

---

## GrapQL Schema

> All graphql reqests are `POST` requests to `/v2/graphql`

### Create User

```JavaScript
mutation {
  createUser(
    firstname: "John",
    lastname: "Doe",
    username: "jdoe",
    authProvider: {
      credentials: {
        email: "doe@email.com",
        password: "passpass",
      }
    }
    ){
    error
    jwt
    user {...}
  }
}

```

### Sign in User

```JavaScript
mutation {
 signinUser(
  credentials: {
    password: "passass",
    email: "jdoe@email.com"
  }
) {
  error
  jwt
  user {...}
 }
}

```

### User Object

```JavaScript
  {
    firstname
    lastname
    email
    username
    tosAgreedAt
    refreshToken
  }
```

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

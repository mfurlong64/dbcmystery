> **Note**: This branch (master) contains a skeleton without any app code, perfect for creating a _new_ application or challenge. If you're looking for an example app built with this skeleton, take a look at the [example](/../..//tree/example) branch which includes basic CRUD and RSpec tests.

### Purpose
The Sinatra Skeleton:

1. Provides a foundation for building challenges or creating a new Sinatra application.
2. Demonstrates a reasonable set of practices around building Sinatra applications.
3. Eases the transition to Rails for Dev Bootcamp students

### Quickstart

1.  `bundle install`
2.  `shotgun config.ru`

As needed, create models & migrations with the `rake` tasks:

```
rake generate:migration  # Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks
rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
```

### Contributing

We would love for you to help make the skeleton more awesome, There are three ways to contribute:

1. Ask for a bug fix or enhancement!
2. Submit a pull request for a bug fix or enhancement!
3. Code review an open pull request!

Be prepared to give and receive specific, actionable, and kind feedback!

### MVC For DBC Grand Heist Mystery

1. Build a working app with users, user_parties, parties - Many to Many relationship
2. Have a successful login for users
3. Have a successful login for a party -- will require a double authentication
4. Be able to vote on a specific party
5. Use the user_parties join session to save the has_voted, votes_against, murderer?
6. Make invites so that uses can join all the things
7. Grant admin access so that only the party creator can invite and

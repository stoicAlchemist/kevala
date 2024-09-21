# README

Ruby version used: 3.3.5

Rails version used: 7.2.1

Postgresql used and required as it's using the Enum types.

To run this project locally:

1. Clone the repository
1. Change directory to the repo `cd kevala`
1. Install all dependencies `bin/bundle install`
1. Run `bin/rails db:reset db:migrate db:seed` after you cd into the repo's directory
1. Run tests by `bin/rails test`
1. Run the development environment by `bin/dev`
1. Use your web browser to navigate to the `localhost:3000`

No navigation bar is provided for now, the routes are: `/locations`, `/employees` and `/shifts`. It's using the default rudimentary styling using Tailwind so it's not very user friendly but also it hides the links added on most of the elements shown.

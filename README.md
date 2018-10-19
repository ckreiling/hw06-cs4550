# Hw06

## Design decisions

I'm treating my server as a view renderer - each endpoint should render HTML
and serve it in the response.

I used code from class to write [`SessionController`](lib/hw06_web/controllers/session_controller.ex).
It simply attaches a session, and returns new HTML. It will serve the login page,
and handle the logout callback.

I also used code from class to help write the [`AdminOnly`](lib/hw06_web/plugs/admin_only.ex) and
[`Authenticate`](lib/hw06_web/plugs/authenticate.ex) plugs. It was useful to
write a `Plug` instead of wrapping _every_ controller method that required a
specific type of user (admin or just authenticated), and then point those
`Plug`s to specific methods within controllers.

The `Authenticate` plug will redirect to the login page if the user is not
authenticated.

## Starting the dev server

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.create && mix ecto.migrate`
- Install Node.js dependencies with `cd assets && npm install`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: http://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix

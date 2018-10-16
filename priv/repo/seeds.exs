# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hw06.Repo.insert!(%Hw06.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Hw06.Repo
alias Hw06.Users.User

Repo.insert!(%User{email: "christian@example.com", admin: true})
Repo.insert!(%User{email: "jan@example.com", admin: false})
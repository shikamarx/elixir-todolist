# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todo.Repo.insert!(%Todo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Todo.Todolist

Todolist.create_item(%{
  status: true,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nisl ac nisl interdum suscipit. Quisque at nulla at eros rhoncus pellentesque."
})

Todolist.create_item(%{
  status: false,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nisl ac nisl interdum suscipit. Quisque at nulla at eros rhoncus pellentesque."
})

Todolist.create_item(%{
  status: false,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nisl ac nisl interdum suscipit. Quisque at nulla at eros rhoncus pellentesque."
})

Todolist.create_item(%{
  status: true,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nisl ac nisl interdum suscipit. Quisque at nulla at eros rhoncus pellentesque."
})

Todolist.create_item(%{
  status: false,
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quis nisl ac nisl interdum suscipit. Quisque at nulla at eros rhoncus pellentesque."
})

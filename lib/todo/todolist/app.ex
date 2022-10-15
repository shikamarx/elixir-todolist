defmodule Todo.Todolist.App do
  alias Todo.Todolist

  def init do
    Todolist.list_items
      |> Enum.sort_by(&(&1.id))
  end

  def add(content) do
    Todolist.create_item(%{content: content |> String.trim, status: false})

    init()
  end

  def change_status(id) do
    item = id
      |> String.to_integer
      |> Todolist.get_item!

    Todolist.update_item(item, %{status: !item.status})

    init()
  end

  def delete(id) do
    id
      |> String.to_integer
      |> Todolist.get_item!
      |> Todolist.delete_item

    init()
  end

  def clear do
    Todolist.list_items
      |> Enum.map(&(Todolist.delete_item(&1)))
  end

  def mark_all do
    Todolist.list_items
      |> Enum.map(&(Todolist.update_item(&1, %{status: true})))

    init()
  end

  def unmark_all do
    Todolist.list_items
      |> Enum.map(&(Todolist.update_item(&1, %{status: false})))

    init()
  end

  def marking_action(items \\ []) do
    case items |> Enum.count(&(!&1.status)) do
      0 -> "unmark_all"
      _ -> "mark_all"
    end
  end
end

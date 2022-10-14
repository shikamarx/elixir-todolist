defmodule TodoWeb.TodoLive do
  use TodoWeb, :live_view
  alias Todo.Todolist

  def mount(_params, _session, socket) do
    items = Todolist.list_items
      |> Enum.sort_by(&(&1.id))
    {:ok, assign(socket, items: items, error: "", done_count: items |> Enum.count(&(&1.status)))}
  end

  def handle_event("add", %{"content" => content}, socket) do
    if 5 > content |> validate_content |> String.length do
      {:noreply, assign(socket, items: socket.assigns.items, error: "Make sure content has at least 5 caracters!")}
    else
      Todolist.create_item(%{content: content, status: false})
      items = Todolist.list_items
        |> Enum.sort_by(&(&1.id))
      {:noreply, assign(socket, items: items, error: "")}
    end
  end

  def handle_event("delete", %{"id" => id}, socket) do
    id
      |> String.to_integer
      |> Todolist.get_item!
      |> Todolist.delete_item
    items = Todolist.list_items
      |> Enum.sort_by(&(&1.id))
    {:noreply, assign(socket, items: items, error: "", done_count: items |> Enum.count(&(&1.status)))}
  end

  def handle_event("change_status", %{"id" => id}, socket) do
    item = id
      |> String.to_integer
      |> Todolist.get_item!
    Todolist.update_item(item, %{status: !item.status})
    items = Todolist.list_items
      |> Enum.sort_by(&(&1.id))
    {:noreply, assign(socket, items: items, done_count: items |> Enum.count(&(&1.status)))}
  end

  def handle_event("clear", _, socket) do
    Todolist.list_items
      |> Enum.map(&(Todolist.delete_item(&1)))
    {:noreply, assign(socket, items: [], done_count: 0)}
  end

  def validate_content(content) do
    content
    |> String.trim()
  end

  def render(assigns) do
    Phoenix.View.render(TodoWeb.TodoView, "index.html", assigns)
  end
end

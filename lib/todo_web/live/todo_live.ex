defmodule TodoWeb.TodoLive do
  use TodoWeb, :live_view
  alias Todo.Todolist.App

  def mount(_params, _session, socket) do
    items = App.init
    {:ok, assign(socket, items: items, error: "", done_count: items |> Enum.count(&(&1.status)), toggle_marking_action: items |> App.marking_action, dark_mode: false)}
  end

  def handle_event("add", %{"content" => content}, socket) do
    items = App.add(content)
    {:noreply, assign(socket, items: items, error: "", toggle_marking_action: items |> App.marking_action)}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    items = App.delete(id)
    {:noreply, assign(socket, items: items, error: "", done_count: items |> Enum.count(&(&1.status)), toggle_marking_action: items |> App.marking_action)}
  end

  def handle_event("change_status", %{"id" => id}, socket) do
    items = App.change_status(id)
    {:noreply, assign(socket, items: items, done_count: items |> Enum.count(&(&1.status)), toggle_marking_action: items |> App.marking_action)}
  end

  def handle_event("clear", _, socket) do
    App.clear
    {:noreply, assign(socket, items: [], done_count: 0)}
  end

  def handle_event("mark_all", _, socket) do
    items = App.mark_all
    {:noreply, assign(socket, items: items, done_count: items |> Enum.count(&(&1.status)), toggle_marking_action: items |> App.marking_action)}
  end

  def handle_event("unmark_all", _, socket) do
    items = App.unmark_all
    {:noreply, assign(socket, items: items, done_count: items |> Enum.count(&(&1.status)), toggle_marking_action: items |> App.marking_action)}
  end

  def handle_event("toggle_dark_mode", %{"dark_mode" => dark_mode}, socket) do
    toggled_dark_mode = !String.to_atom(dark_mode)
    {:noreply, assign(socket, dark_mode: toggled_dark_mode)}
  end

  def render(assigns) do
    Phoenix.View.render(TodoWeb.TodoView, "index.html", assigns)
  end
end

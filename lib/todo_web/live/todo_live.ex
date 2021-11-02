defmodule TodoWeb.TodoLive do
  use TodoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, todolist: [], error: "")}
  end

  def handle_event("add", %{"label" => label}, socket) do
    new_todolist = [%{label: label |> validate_todo_label(), done: false}|socket.assigns.todolist]
    if 5 > label |> validate_todo_label |> String.length do
      {:noreply, assign(socket, todolist: socket.assigns.todolist, error: "Make sure content has at least 5 caracters!")}
    else
      {:noreply, assign(socket, todolist: new_todolist, error: "")}
    end
  end

  def handle_event("delete", %{"index" => index}, socket) do
    todolist = socket.assigns.todolist
    {:noreply, assign(socket, todolist: List.delete_at(todolist, String.to_integer(index)), error: "")}
  end

  def handle_event("change_status", %{"index" => index}, socket) do
    todolist = socket.assigns.todolist
    todo = Enum.at(todolist, String.to_integer(index))
    {:noreply, assign(socket, todolist: List.replace_at(todolist, String.to_integer(index), %{label: todo.label, done: !todo.done}))}
  end

  def validate_todo_label(label) do
    label
    |> String.trim()
  end

  def render(assigns) do
    Phoenix.View.render(TodoWeb.TodoView, "index.html", assigns)
  end
end

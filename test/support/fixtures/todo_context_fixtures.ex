defmodule Todo.TodoContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.TodoContext` context.
  """

  @doc """
  Generate a todo_schema.
  """
  def todo_schema_fixture(attrs \\ %{}) do
    {:ok, todo_schema} =
      attrs
      |> Enum.into(%{
        done: true,
        label: "some label"
      })
      |> Todo.TodoContext.create_todo_schema()

    todo_schema
  end
end

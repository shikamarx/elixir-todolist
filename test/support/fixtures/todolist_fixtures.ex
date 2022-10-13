defmodule Todo.TodolistFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Todolist` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        content: "some content",
        status: "some status"
      })
      |> Todo.Todolist.create_item()

    item
  end
end

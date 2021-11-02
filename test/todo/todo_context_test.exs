defmodule Todo.TodoContextTest do
  use Todo.DataCase

  alias Todo.TodoContext

  describe "todolist" do
    alias Todo.TodoContext.TodoSchema

    import Todo.TodoContextFixtures

    @invalid_attrs %{done: nil, label: nil}

    test "list_todolist/0 returns all todolist" do
      todo_schema = todo_schema_fixture()
      assert TodoContext.list_todolist() == [todo_schema]
    end

    test "get_todo_schema!/1 returns the todo_schema with given id" do
      todo_schema = todo_schema_fixture()
      assert TodoContext.get_todo_schema!(todo_schema.id) == todo_schema
    end

    test "create_todo_schema/1 with valid data creates a todo_schema" do
      valid_attrs = %{done: true, label: "some label"}

      assert {:ok, %TodoSchema{} = todo_schema} = TodoContext.create_todo_schema(valid_attrs)
      assert todo_schema.done == true
      assert todo_schema.label == "some label"
    end

    test "create_todo_schema/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoContext.create_todo_schema(@invalid_attrs)
    end

    test "update_todo_schema/2 with valid data updates the todo_schema" do
      todo_schema = todo_schema_fixture()
      update_attrs = %{done: false, label: "some updated label"}

      assert {:ok, %TodoSchema{} = todo_schema} = TodoContext.update_todo_schema(todo_schema, update_attrs)
      assert todo_schema.done == false
      assert todo_schema.label == "some updated label"
    end

    test "update_todo_schema/2 with invalid data returns error changeset" do
      todo_schema = todo_schema_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoContext.update_todo_schema(todo_schema, @invalid_attrs)
      assert todo_schema == TodoContext.get_todo_schema!(todo_schema.id)
    end

    test "delete_todo_schema/1 deletes the todo_schema" do
      todo_schema = todo_schema_fixture()
      assert {:ok, %TodoSchema{}} = TodoContext.delete_todo_schema(todo_schema)
      assert_raise Ecto.NoResultsError, fn -> TodoContext.get_todo_schema!(todo_schema.id) end
    end

    test "change_todo_schema/1 returns a todo_schema changeset" do
      todo_schema = todo_schema_fixture()
      assert %Ecto.Changeset{} = TodoContext.change_todo_schema(todo_schema)
    end
  end
end

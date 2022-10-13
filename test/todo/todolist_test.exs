defmodule Todo.TodolistTest do
  use Todo.DataCase

  alias Todo.Todolist

  describe "items" do
    alias Todo.Todolist.Item

    import Todo.TodolistFixtures

    @invalid_attrs %{content: nil, status: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Todolist.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Todolist.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{content: "some content", status: "some status"}

      assert {:ok, %Item{} = item} = Todolist.create_item(valid_attrs)
      assert item.content == "some content"
      assert item.status == "some status"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todolist.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{content: "some updated content", status: "some updated status"}

      assert {:ok, %Item{} = item} = Todolist.update_item(item, update_attrs)
      assert item.content == "some updated content"
      assert item.status == "some updated status"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Todolist.update_item(item, @invalid_attrs)
      assert item == Todolist.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Todolist.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Todolist.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Todolist.change_item(item)
    end
  end
end

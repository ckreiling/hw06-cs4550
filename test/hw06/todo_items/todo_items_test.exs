defmodule Hw06.TodoItemsTest do
  use Hw06.DataCase

  alias Hw06.TodoItems

  describe "todo_items" do
    alias Hw06.TodoItems.TodoItem

    @valid_attrs %{completed: true, description: "some description", time_spent: 42, title: "some title"}
    @update_attrs %{completed: false, description: "some updated description", time_spent: 43, title: "some updated title"}
    @invalid_attrs %{completed: nil, description: nil, time_spent: nil, title: nil}

    def todo_item_fixture(attrs \\ %{}) do
      {:ok, todo_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TodoItems.create_todo_item()

      todo_item
    end

    test "list_todo_items/0 returns all todo_items" do
      todo_item = todo_item_fixture()
      assert TodoItems.list_todo_items() == [todo_item]
    end

    test "get_todo_item!/1 returns the todo_item with given id" do
      todo_item = todo_item_fixture()
      assert TodoItems.get_todo_item!(todo_item.id) == todo_item
    end

    test "create_todo_item/1 with valid data creates a todo_item" do
      assert {:ok, %TodoItem{} = todo_item} = TodoItems.create_todo_item(@valid_attrs)
      assert todo_item.completed == true
      assert todo_item.description == "some description"
      assert todo_item.time_spent == 42
      assert todo_item.title == "some title"
    end

    test "create_todo_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoItems.create_todo_item(@invalid_attrs)
    end

    test "update_todo_item/2 with valid data updates the todo_item" do
      todo_item = todo_item_fixture()
      assert {:ok, %TodoItem{} = todo_item} = TodoItems.update_todo_item(todo_item, @update_attrs)

      
      assert todo_item.completed == false
      assert todo_item.description == "some updated description"
      assert todo_item.time_spent == 43
      assert todo_item.title == "some updated title"
    end

    test "update_todo_item/2 with invalid data returns error changeset" do
      todo_item = todo_item_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoItems.update_todo_item(todo_item, @invalid_attrs)
      assert todo_item == TodoItems.get_todo_item!(todo_item.id)
    end

    test "delete_todo_item/1 deletes the todo_item" do
      todo_item = todo_item_fixture()
      assert {:ok, %TodoItem{}} = TodoItems.delete_todo_item(todo_item)
      assert_raise Ecto.NoResultsError, fn -> TodoItems.get_todo_item!(todo_item.id) end
    end

    test "change_todo_item/1 returns a todo_item changeset" do
      todo_item = todo_item_fixture()
      assert %Ecto.Changeset{} = TodoItems.change_todo_item(todo_item)
    end
  end
end

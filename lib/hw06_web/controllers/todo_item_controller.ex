defmodule Hw06Web.TodoItemController do
  use Hw06Web, :controller

  require Logger

  plug Hw06Web.Plugs.Authenticate when action in [:new, :create, :show, :edit, :update, :delete]

  alias Hw06.TodoItems
  alias Hw06.TodoItems.TodoItem
  alias Hw06.Users

  def index(conn, _params) do
    todo_items = TodoItems.list_todo_items()
    render(conn, "index.html", todo_items: todo_items)
  end

  def new(conn, _params) do
    changeset = TodoItems.change_todo_item(%TodoItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"todo_item" => todo_item_params}) do
    case TodoItems.create_todo_item(todo_item_params) do
      {:ok, todo_item} ->
        conn
        |> put_flash(:info, "Todo item created successfully.")
        |> redirect(to: Routes.todo_item_path(conn, :show, todo_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_item = TodoItems.get_todo_item!(id)
    render(conn, "show.html", todo_item: todo_item)
  end

  def edit(conn, %{"id" => id}) do
    todo_item = TodoItems.get_todo_item!(id)
    changeset = TodoItems.change_todo_item(todo_item)
    render(conn, "edit.html", todo_item: todo_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo_item" => todo_item_params}) do
    todo_item = TodoItems.get_todo_item!(id)
    email = Map.get todo_item_params, "assigned_to"

    unless email == "" do
      user = Users.get_user_by_email email
      unless is_nil(user) do
        todo_item_params = Map.put todo_item_params, "assigned_to", user.id
        case TodoItems.update_todo_item(todo_item, todo_item_params) do
          {:ok, todo_item} ->
            conn
            |> put_flash(:info, "Todo item updated successfully.")
            |> redirect(to: Routes.todo_item_path(conn, :show, todo_item))
    
          {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "edit.html", todo_item: todo_item, changeset: changeset)
        end    
      else
        conn
        |> put_flash(:error, "You can't assign to that user because they don't exist. Register them first.")
        |> edit(%{"id" => todo_item.id})
        |> halt
      end
    end

    case TodoItems.update_todo_item(todo_item, todo_item_params) do
      {:ok, todo_item} ->
        conn
        |> put_flash(:info, "Todo item updated successfully.")
        |> redirect(to: Routes.todo_item_path(conn, :show, todo_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", todo_item: todo_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_item = TodoItems.get_todo_item!(id)
    {:ok, _todo_item} = TodoItems.delete_todo_item(todo_item)

    conn
    |> put_flash(:info, "Todo item deleted successfully.")
    |> redirect(to: Routes.todo_item_path(conn, :index))
  end
end

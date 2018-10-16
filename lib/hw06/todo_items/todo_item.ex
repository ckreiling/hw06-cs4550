defmodule Hw06.TodoItems.TodoItem do
  use Ecto.Schema
  import Ecto.Changeset


  schema "todo_items" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time_spent, :integer
    field :title, :string
    field :assigned_to, :id

    timestamps()
  end

  @doc false
  def changeset(todo_item, attrs) do
    todo_item
    |> cast(attrs, [:title, :description, :completed, :time_spent])
    |> validate_required([:title, :description, :completed, :time_spent])
  end
end

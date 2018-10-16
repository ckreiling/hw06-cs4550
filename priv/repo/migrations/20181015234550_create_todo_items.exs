defmodule Hw06.Repo.Migrations.CreateTodoItems do
  use Ecto.Migration

  def change do
    create table(:todo_items) do
      add :title, :string, null: false
      add :description, :text, null: false
      add :completed, :boolean, default: false, null: false
      add :time_spent, :integer
      add :assigned_to, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:todo_items, [:assigned_to])
  end
end

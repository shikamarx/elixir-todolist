defmodule Todo.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :status, :boolean
      add :content, :string

      timestamps()
    end
  end
end

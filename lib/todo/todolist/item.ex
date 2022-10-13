defmodule Todo.Todolist.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :content, :string
    field :status, :boolean

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:status, :content])
    |> validate_required([:status, :content])
    |> validate_length(:content, min: 5)
  end
end

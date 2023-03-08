defmodule Publisher.Admins.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "admins" do
    field :dni, :string
    field :name, :string
    belongs_to :library, Publisher.Libraries.Library

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:library_id, :name, :dni])
    |> validate_required([:library_id, :name, :dni])
  end
end

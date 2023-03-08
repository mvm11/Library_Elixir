defmodule Publisher.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "books" do
    field :author, :string
    field :name, :string
    field :state, :boolean
    belongs_to :library, Publisher.Libraries.Library

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:library_id, :name, :author, :state])
    |> validate_required([:library_id, :name, :author, :state])
  end
end

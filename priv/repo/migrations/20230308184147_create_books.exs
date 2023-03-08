defmodule Publisher.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :author, :string
      add :library_id, references(:libraries, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:books, [:library_id, :name])
  end
end

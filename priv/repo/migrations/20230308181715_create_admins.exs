defmodule Publisher.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :dni, :string
      add :library_id, references(:libraries, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:admins, [:library_id, :name])
  end
end

defmodule Publisher.AdminsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Publisher.Admins` context.
  """

  @doc """
  Generate a admin.
  """
  def admin_fixture(attrs \\ %{}) do
    {:ok, admin} =
      attrs
      |> Enum.into(%{
        dni: "some dni",
        name: "some name"
      })
      |> Publisher.Admins.create_admin()

    admin
  end
end

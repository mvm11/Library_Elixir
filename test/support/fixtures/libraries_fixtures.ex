defmodule Publisher.LibrariesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Publisher.Libraries` context.
  """

  @doc """
  Generate a library.
  """
  def library_fixture(attrs \\ %{}) do
    {:ok, library} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Publisher.Libraries.create_library()

    library
  end
end

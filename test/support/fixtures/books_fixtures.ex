defmodule Publisher.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Publisher.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        name: "some name"
      })
      |> Publisher.Books.create_book()

    book
  end
end

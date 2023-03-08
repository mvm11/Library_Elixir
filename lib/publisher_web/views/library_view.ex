defmodule PublisherWeb.LibraryView do
  use PublisherWeb, :view
  alias PublisherWeb.{LibraryView, AdminView, BookView}

  def render("index.json", %{libraries: libraries}) do
    %{data: render_many(libraries, LibraryView, "library.json")}
  end

  def render("show.json", %{library: library}) do
    %{data: render_one(library, LibraryView, "library.json")}
  end

  def render("library.json", %{library: library}) do
    %{
      id: library.id,
      name: library.name
    }
  end

  def render("full_library.json", %{library: library}) do
    %{
      id: library.id,
      name: library.name,
      admin: render_one(library.admin, AdminView, "admin.json"),
      books: render_many(library.books, BookView, "book.json")
    }
  end
end

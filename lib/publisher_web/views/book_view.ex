defmodule PublisherWeb.BookView do
  use PublisherWeb, :view
  alias PublisherWeb.BookView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{
      id: book.id,
      name: book.name,
      author: book.author,
      state: book.state
    }
  end
end

defmodule PublisherWeb.BookController do
  use PublisherWeb, :controller

  alias Publisher.Books
  alias Publisher.Books.Book

  action_fallback PublisherWeb.FallbackController

  def index(conn, _params) do
    books = Books.list_books()
    render(conn, "index.json", books: books)
  end

  def create(conn, %{"book" => book_params}) do
    with {:ok, %Book{} = book} <- Books.create_book(book_params) do
      conn
      |> put_status(:created)
      |> render("show.json", book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Books.get_book!(id)
    render(conn, "show.json", book: book)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Books.get_book!(id)

    with {:ok, %Book{} = book} <- Books.update_book(book, book_params) do
      render(conn, "show.json", book: book)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Books.get_book!(id)

    with {:ok, %Book{}} <- Books.delete_book(book) do
      send_resp(conn, :no_content, "")
    end
  end

  def lend_book(conn, %{"id" => id}) do

    book = Books.get_book!(id)

    case book do
      nil ->
        conn
        |> put_status(:not_found)
        |> render("404.html")
      _ ->

        Books.update_book(book, %{name: book.name, author: book.author, state: true})

        conn
        |> redirect(to: Routes.book_path(conn, :show, book))
    end
  end

  def return(conn, %{"id" => id}) do

    book = Books.get_book!(id)

    case book do
      nil ->
        conn
        |> put_status(:not_found)
        |> render("404.html")
      _ ->

        Books.update_book(book, %{author: book.author, name: book.author, state: false})

        conn
        |> redirect(to: Routes.book_path(conn, :show, book))
    end
  end

end

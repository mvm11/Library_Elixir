defmodule PublisherWeb.LibraryController do
  use PublisherWeb, :controller

  alias Publisher.Libraries
  alias Publisher.Libraries.Library

  action_fallback PublisherWeb.FallbackController

  def index(conn, _params) do
    libraries = Libraries.list_libraries()
    render(conn, "index.json", libraries: libraries)
  end

  def create(conn, %{"library" => library_params}) do
    with {:ok, %Library{} = library} <- Libraries.create_library(library_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.library_path(conn, :show, library))
      |> render("show.json", library: library)
    end
  end

  def show(conn, %{"id" => id}) do
    library = Libraries.get_full_library(id)
    render(conn, "full_library.json", library: library)
  end

  def show_by_name(conn,  %{"name" => name}) do
    library = get_library_by_name(name)

    if library !== nil do
      render(conn, "full_library.json", library: library)
    else
      conn |> put_status(404) |> json(%{error: "Publisher not found"})
    end

  end

  def get_library_by_name(name) do
    Libraries.list_libraries
    |> Enum.filter(fn library -> name === library.name end)
    |> List.first
  end

  def update(conn, %{"id" => id, "library" => library_params}) do
    library = Libraries.get_library!(id)

    with {:ok, %Library{} = library} <- Libraries.update_library(library, library_params) do
      render(conn, "show.json", library: library)
    end
  end

  def delete(conn, %{"id" => id}) do
    library = Libraries.get_library!(id)

    with {:ok, %Library{}} <- Libraries.delete_library(library) do
      send_resp(conn, :no_content, "")
    end
  end

  def delete_by_name(conn,  %{"name" => name}) do
    library = get_library_by_name(name)

    with {:ok, %Library{}} <- Libraries.delete_library(library) do
      send_resp(conn, :no_content, "")
    end
  end
end

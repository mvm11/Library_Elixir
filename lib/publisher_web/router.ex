defmodule PublisherWeb.Router do
  use PublisherWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PublisherWeb do
    pipe_through :api

    # Libraries routes
    get "/libraries", LibraryController, :index
    get "/libraries/:id", LibraryController, :show
    get "/libraries/name/:name", LibraryController, :show_by_name
    post "/libraries", LibraryController, :create
    put "/libraries/:id", LibraryController, :update
    delete "/libraries/:id", LibraryController, :delete
    delete "/libraries/name/:name", LibraryController, :delete_by_name

    # Admins routes
    get "/admins", AdminController, :index
    get "/admins/:id", AdminController, :show
    post "/admins", AdminController, :create
    put "/admins/:id", AdminController, :update
    delete "/admins/:id", AdminController, :delete

    # Admins routes
    get "/books", BookController, :index
    get "/books/:id", BookController, :show
    post "/books", BookController, :create
    put "/books/:id", BookController, :update
    put "/books/lend/:id", BookController, :lend_book
    put "/books/return/:id", BookController, :return
    delete "/books/:id", BookController, :delete
  end
end

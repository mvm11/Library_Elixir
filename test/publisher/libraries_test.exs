defmodule Publisher.LibrariesTest do
  use Publisher.DataCase

  alias Publisher.Libraries

  describe "libraries" do
    alias Publisher.Libraries.Library

    import Publisher.LibrariesFixtures

    @invalid_attrs %{name: nil}

    test "list_libraries/0 returns all libraries" do
      library = library_fixture()
      assert Libraries.list_libraries() == [library]
    end

    test "get_library!/1 returns the library with given id" do
      library = library_fixture()
      assert Libraries.get_library!(library.id) == library
    end

    test "create_library/1 with valid data creates a library" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Library{} = library} = Libraries.create_library(valid_attrs)
      assert library.name == "some name"
    end

    test "create_library/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Libraries.create_library(@invalid_attrs)
    end

    test "update_library/2 with valid data updates the library" do
      library = library_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Library{} = library} = Libraries.update_library(library, update_attrs)
      assert library.name == "some updated name"
    end

    test "update_library/2 with invalid data returns error changeset" do
      library = library_fixture()
      assert {:error, %Ecto.Changeset{}} = Libraries.update_library(library, @invalid_attrs)
      assert library == Libraries.get_library!(library.id)
    end

    test "delete_library/1 deletes the library" do
      library = library_fixture()
      assert {:ok, %Library{}} = Libraries.delete_library(library)
      assert_raise Ecto.NoResultsError, fn -> Libraries.get_library!(library.id) end
    end

    test "change_library/1 returns a library changeset" do
      library = library_fixture()
      assert %Ecto.Changeset{} = Libraries.change_library(library)
    end
  end
end

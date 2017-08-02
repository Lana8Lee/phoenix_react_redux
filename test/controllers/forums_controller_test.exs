defmodule PhoenixReactRedux.ForumsControllerTest do
  use PhoenixReactRedux.ConnCase

  alias PhoenixReactRedux.Forums
  @valid_attrs %{email: "some content", name: "some content", username: "some content", users: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, forums_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing user"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, forums_path(conn, :new)
    assert html_response(conn, 200) =~ "New forums"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, forums_path(conn, :create), forums: @valid_attrs
    assert redirected_to(conn) == forums_path(conn, :index)
    assert Repo.get_by(Forums, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, forums_path(conn, :create), forums: @invalid_attrs
    assert html_response(conn, 200) =~ "New forums"
  end

  test "shows chosen resource", %{conn: conn} do
    forums = Repo.insert! %Forums{}
    conn = get conn, forums_path(conn, :show, forums)
    assert html_response(conn, 200) =~ "Show forums"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, forums_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    forums = Repo.insert! %Forums{}
    conn = get conn, forums_path(conn, :edit, forums)
    assert html_response(conn, 200) =~ "Edit forums"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    forums = Repo.insert! %Forums{}
    conn = put conn, forums_path(conn, :update, forums), forums: @valid_attrs
    assert redirected_to(conn) == forums_path(conn, :show, forums)
    assert Repo.get_by(Forums, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    forums = Repo.insert! %Forums{}
    conn = put conn, forums_path(conn, :update, forums), forums: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit forums"
  end

  test "deletes chosen resource", %{conn: conn} do
    forums = Repo.insert! %Forums{}
    conn = delete conn, forums_path(conn, :delete, forums)
    assert redirected_to(conn) == forums_path(conn, :index)
    refute Repo.get(Forums, forums.id)
  end
end

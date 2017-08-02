defmodule PhoenixReactRedux.ForumsController do
  use PhoenixReactRedux.Web, :controller

  alias PhoenixReactRedux.Forums

  def index(conn, _params) do
    user = Repo.all(Forums)
    render(conn, "index.html", user: user)
  end

  def new(conn, _params) do
    changeset = Forums.changeset(%Forums{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"forums" => forums_params}) do
    changeset = Forums.changeset(%Forums{}, forums_params)

    case Repo.insert(changeset) do
      {:ok, _forums} ->
        conn
        |> put_flash(:info, "Forums created successfully.")
        |> redirect(to: forums_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    forums = Repo.get!(Forums, id)
    render(conn, "show.html", forums: forums)
  end

  def edit(conn, %{"id" => id}) do
    forums = Repo.get!(Forums, id)
    changeset = Forums.changeset(forums)
    render(conn, "edit.html", forums: forums, changeset: changeset)
  end

  def update(conn, %{"id" => id, "forums" => forums_params}) do
    forums = Repo.get!(Forums, id)
    changeset = Forums.changeset(forums, forums_params)

    case Repo.update(changeset) do
      {:ok, forums} ->
        conn
        |> put_flash(:info, "Forums updated successfully.")
        |> redirect(to: forums_path(conn, :show, forums))
      {:error, changeset} ->
        render(conn, "edit.html", forums: forums, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    forums = Repo.get!(Forums, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(forums)

    conn
    |> put_flash(:info, "Forums deleted successfully.")
    |> redirect(to: forums_path(conn, :index))
  end
end

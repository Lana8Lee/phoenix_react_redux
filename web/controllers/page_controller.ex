defmodule PhoenixReactRedux.PageController do
  use PhoenixReactRedux.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

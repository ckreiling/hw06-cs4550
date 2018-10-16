defmodule Hw06Web.PageController do
  use Hw06Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

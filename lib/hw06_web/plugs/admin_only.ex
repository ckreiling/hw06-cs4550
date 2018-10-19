defmodule Hw06Web.Plugs.AdminOnly do
  use Hw06Web, :controller

  def init(args), do: args

  def call(conn, _params) do
    user = conn.assigns[:current_user]
    if user && user.admin do
      conn
    else
      conn
      |> put_flash(:error, "You must be admin to access that page.")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt
    end
  end
end
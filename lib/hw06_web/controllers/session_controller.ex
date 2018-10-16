defmodule Hw06Web.SessionController do
  use Hw06Web, :controller

  def login(conn, _params) do
    render(conn, "index.html")
  end

  def logout(conn, _params), do: delete(conn, _params)

  def create(conn, %{"email" => email}) do
    user = Hw06.Users.get_user_by_email(email)
    if user do
      conn
      |> put_session(:user_id, user.email)
      |> put_flash(:info, "Welcome back #{user.email}")
      |> redirect(to: Routes.page_path(conn, :index))
    else
      conn
      |> put_flash(:error, "There is no Email with this account.")
      |> login(conn)
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end

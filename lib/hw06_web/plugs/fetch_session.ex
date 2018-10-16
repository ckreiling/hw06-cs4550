defmodule Hw06Web.Plugs.FetchSession do
  import Plug.Conn

  def init(args), do: args

  def call(conn, _args) do
    user_session = get_session(conn, :user_id)
    unless is_nil(user_session) do
      user = Hw06.Users.get_user_by_email(user_session)
      assign(conn, :current_user, user)
    else
      assign(conn, :current_user, nil)
    end
  end
end
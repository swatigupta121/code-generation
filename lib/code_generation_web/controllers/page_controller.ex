defmodule CodeGenerationWeb.PageController do
  use CodeGenerationWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

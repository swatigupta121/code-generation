defmodule Mix.Tasks.CreateTemplate do
  use Mix.Task

  def run([file_name]) do
    create_temp([file_name])
    map = %{a: 1, b: 2}
    IO.inspect(EEx.eval_file("priv/template/create_file/controller.ex", bar: map))
  end

  defp create_temp([file_name]) do
    app_dir = File.cwd!
    app_name = Path.basename(app_dir)
    mk_path = Path.join(
      ["lib", app_name <> "_web", "templates", "#{file_name}"]
    )
    IO.inspect(File.mkdir(mk_path))
    new_file_path = Path.join(
      [app_dir, "lib", app_name <> "_web", "templates", "#{file_name}", "#{file_name}.html.heex"]
    )
    # [first, second] = String.split(app_name, "_")
    File.write(
      new_file_path,
      """
      a=foo <%= bar.a %> hello <%= bar.b %>

      """,
      [:write]
    )
  end
end
#

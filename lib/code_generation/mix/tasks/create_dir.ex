defmodule Mix.Tasks.CreateDir do
  use Mix.Task

  def run([file_name]) do
    demofile1([file_name])
    demofile2([file_name])
  end

  defp demofile1([file_name]) do
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

  defp demofile2([file_name]) do
    app_dir = File.cwd!
    app_name = Path.basename(app_dir)
    mk_path = Path.join(
      ["lib", app_name <> "_web", "views", "#{file_name}"]
    )
    IO.inspect(File.mkdir(mk_path))
    new_file_path = Path.join(
      [app_dir, "lib", app_name <> "_web", "views", "#{file_name}", "#{file_name}_view.ex"]
    )
    [first, second] = String.split(app_name, "_")
    File.write(
      new_file_path,
      """
      defmodule #{String.capitalize(first) <> String.capitalize(second)}.#{String.capitalize(file_name)}View do
        def hi do
        end

        def goodbye do
        end
      end
      """,
      [:write]
    )
  end

end

defmodule Mix.Tasks.CreateFile do
  use Mix.Task

  def run([file_name]) do
    demofile1([file_name])
    demofile2([file_name])
  end

  defp demofile1([file_name]) do
    app_dir = File.cwd!
    app_name = Path.basename(app_dir)
    new_file_path = Path.join(
        [app_dir, "lib", app_name, "#{file_name}.ex"]
    )
    [first, second] = String.split(app_name, "_")
    File.write(
      new_file_path,
      """
      defmodule #{String.capitalize(first) <> String.capitalize(second)}.#{String.capitalize(file_name)} do
        def hello do
        end

        def goodbye do
        end
      end
      """,
      [:write]
    )
  end

  defp demofile2([file_name]) do
    app_dir = File.cwd!
    app_name = Path.basename(app_dir)
    new_file_path = Path.join(
        [app_dir, "lib", app_name <> "_web", "views", "#{file_name}.ex"]
    )
    [first, second] = String.split(app_name, "_")
    IO.inspect(first)
    IO.inspect(second)
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

defmodule ElixirLS.Utils.Launch do
  def start_mix do
    Mix.start()
    Mix.Local.append_archives()
    Mix.Local.append_paths()
    load_dot_config()
    :ok
  end

  defp load_dot_config do
    path = Path.join(Mix.Utils.mix_home(), "config.exs")

    if File.regular?(path) do
      Mix.Task.run("loadconfig", [path])
    end
  end
end

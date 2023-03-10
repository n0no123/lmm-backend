defmodule LMMWeb.WordJSON do
  alias LMM.Wordle.Word

  @doc """
  Renders a list of words.
  """
  def index(%{words: words}) do
    %{data: for(word <- words, do: data(word))}
  end

  @doc """
  Renders a single word.
  """
  def show(%{word: word}) do
    %{data: data(word)}
  end

  defp data(%Word{} = word) do
    %{
      id: word.id,
      value: word.value
    }
  end
end

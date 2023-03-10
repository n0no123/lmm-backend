defmodule LMM.WordleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LMM.Wordle` context.
  """

  @doc """
  Generate a word.
  """
  def word_fixture(attrs \\ %{}) do
    {:ok, word} =
      attrs
      |> Enum.into(%{
        value: "some value"
      })
      |> LMM.Wordle.create_word()

    word
  end
end

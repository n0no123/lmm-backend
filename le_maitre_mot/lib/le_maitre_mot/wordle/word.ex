defmodule LMM.Wordle.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end

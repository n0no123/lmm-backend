defmodule LMMWeb.WordController do
  use LMMWeb, :controller

  alias LMM.Wordle
  alias LMM.Wordle.Word

  action_fallback(LMMWeb.FallbackController)

  def index(conn, _params) do
    name = File.read!("daily.txt")
    json(conn, %{name: name})
  end

  def create(conn, %{"word" => word_params}) do
    with {:ok, %Word{} = word} <- Wordle.create_word(word_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/words/#{word}")
      |> render(:show, word: word)
    end
  end

  def show(conn, %{"id" => id}) do
    word = Wordle.get_word!(id)
    render(conn, :show, word: word)
  end

  def update(conn, %{"id" => id, "word" => word_params}) do
    word = Wordle.get_word!(id)

    with {:ok, %Word{} = word} <- Wordle.update_word(word, word_params) do
      render(conn, :show, word: word)
    end
  end

  def delete(conn, %{"id" => id}) do
    word = Wordle.get_word!(id)

    with {:ok, %Word{}} <- Wordle.delete_word(word) do
      send_resp(conn, :no_content, "")
    end
  end
end

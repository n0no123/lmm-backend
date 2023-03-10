defmodule LMMWeb.WordControllerTest do
  use LMMWeb.ConnCase

  import LMM.WordleFixtures

  alias LMM.Wordle.Word

  @create_attrs %{
    value: "some value"
  }
  @update_attrs %{
    value: "some updated value"
  }
  @invalid_attrs %{value: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all words", %{conn: conn} do
      conn = get(conn, ~p"/api/words")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create word" do
    test "renders word when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/words", word: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/words/#{id}")

      assert %{
               "id" => ^id,
               "value" => "some value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/words", word: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update word" do
    setup [:create_word]

    test "renders word when data is valid", %{conn: conn, word: %Word{id: id} = word} do
      conn = put(conn, ~p"/api/words/#{word}", word: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/words/#{id}")

      assert %{
               "id" => ^id,
               "value" => "some updated value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, word: word} do
      conn = put(conn, ~p"/api/words/#{word}", word: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete word" do
    setup [:create_word]

    test "deletes chosen word", %{conn: conn, word: word} do
      conn = delete(conn, ~p"/api/words/#{word}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/words/#{word}")
      end
    end
  end

  defp create_word(_) do
    word = word_fixture()
    %{word: word}
  end
end

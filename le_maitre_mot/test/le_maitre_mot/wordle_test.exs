defmodule LMM.WordleTest do
  use LMM.DataCase

  alias LMM.Wordle

  describe "words" do
    alias LMM.Wordle.Word

    import LMM.WordleFixtures

    @invalid_attrs %{value: nil}

    test "list_words/0 returns all words" do
      word = word_fixture()
      assert Wordle.list_words() == [word]
    end

    test "get_word!/1 returns the word with given id" do
      word = word_fixture()
      assert Wordle.get_word!(word.id) == word
    end

    test "create_word/1 with valid data creates a word" do
      valid_attrs = %{value: "some value"}

      assert {:ok, %Word{} = word} = Wordle.create_word(valid_attrs)
      assert word.value == "some value"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wordle.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      update_attrs = %{value: "some updated value"}

      assert {:ok, %Word{} = word} = Wordle.update_word(word, update_attrs)
      assert word.value == "some updated value"
    end

    test "update_word/2 with invalid data returns error changeset" do
      word = word_fixture()
      assert {:error, %Ecto.Changeset{}} = Wordle.update_word(word, @invalid_attrs)
      assert word == Wordle.get_word!(word.id)
    end

    test "delete_word/1 deletes the word" do
      word = word_fixture()
      assert {:ok, %Word{}} = Wordle.delete_word(word)
      assert_raise Ecto.NoResultsError, fn -> Wordle.get_word!(word.id) end
    end

    test "change_word/1 returns a word changeset" do
      word = word_fixture()
      assert %Ecto.Changeset{} = Wordle.change_word(word)
    end
  end
end

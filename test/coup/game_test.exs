defmodule Coup.GameTest do
  use Coup.DataCase
  alias Coup.Game

  test "can create a new game" do
    changeset = Game.changeset(%Game{}, %{})
    {:ok, game} = Repo.insert(changeset)
    assert game.id
    assert game.token
    assert game.id == Repo.get_by(Game, token: game.token).id
  end
end

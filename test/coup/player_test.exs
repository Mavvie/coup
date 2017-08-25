defmodule Coup.PlayerTest do
  use Coup.DataCase

  test "can create a new player" do
    {:ok, game} = make_game()
    {:ok, player} = make_player(game)
    assert player.game_id == game.id
  end
end

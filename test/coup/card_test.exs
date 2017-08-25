defmodule Coup.CardTest do
  use Coup.DataCase
  alias Coup.Card

  test "can create a new card" do
    {:ok, game} = make_game()
    {:ok, player} = make_player(game)
    {:ok, card} = Repo.insert(Card.changeset(%Card{}, %{player_id: player.id, kind: "duke"}))
    assert card.player_id == player.id
    assert "duke" == card.kind

    player = player |> Repo.preload(:cards)
    assert 1 == length(player.cards)
    assert [card.id] == Enum.map(player.cards, fn c -> c.id end)
  end
end

defmodule Coup.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Coup.Game
  alias Coup.Player
  alias Coup.Card


  schema "players" do
    field :name, :string

    belongs_to :game, Game
    has_many :cards, Card

    timestamps()
  end

  @doc false
  def changeset(%Player{} = player, attrs) do
    player
    |> cast(attrs, [:name, :game_id])
    |> cast_assoc(:game)
    |> validate_required([:name, :game_id])
  end
end

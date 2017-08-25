defmodule Coup.Card do
  use Ecto.Schema
  import Ecto.Changeset
  alias Coup.Card
  alias Coup.Player

  def kinds do
    ~w(duke assassin contessa captain ambassador)
  end

  schema "cards" do
    field :kind, :string

    belongs_to :player, Player

    timestamps()
  end

  @doc false
  def changeset(%Card{} = card, attrs) do
    card
    |> cast(attrs, [:kind, :player_id])
    |> cast_assoc(:player)
    |> validate_required([:kind, :player_id])
    |> validate_inclusion(:kind, kinds())
  end
end

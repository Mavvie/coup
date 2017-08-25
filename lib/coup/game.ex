defmodule Coup.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias Coup.Game
  alias Coup.Player


  schema "games" do
    field :token,   :string, null: false
    field :status,  :string, null: false, default: "waiting"

    has_many :players, Player

    timestamps()
  end

  @doc false
  def changeset(%Game{} = game, attrs) do
    game
    |> cast(attrs, [:status])
    |> default_token
    |> validate_required([:token, :status])
  end

  defp default_token(changeset) do
    changeset |> put_change(:token, :crypto.strong_rand_bytes(16) |> Base.url_encode64 |> binary_part(0, 16))
  end
end

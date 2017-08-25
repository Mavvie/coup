defmodule Coup.Repo.Migrations.AddCoinsToPlayers do
  use Ecto.Migration

  def change do
    alter table("players") do
      add :coins, :integer, default: 0, null: false
    end
  end
end

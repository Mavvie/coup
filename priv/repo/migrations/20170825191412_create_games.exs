defmodule Coup.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :token,   :string, null: false
      add :status,  :string, null: false, default: "waiting"


      timestamps()
    end
    create unique_index :games, :token

  end
end

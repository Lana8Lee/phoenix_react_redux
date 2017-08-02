defmodule PhoenixReactRedux.Repo.Migrations.CreateForums do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :users, :string
      add :username, :string
      add :email, :string
      add :name, :string

      timestamps()
    end

  end
end

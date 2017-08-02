defmodule PhoenixReactRedux.Forums do
  use PhoenixReactRedux.Web, :model

  schema "user" do
    field :users, :string
    field :username, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:users, :username, :email, :name])
    |> validate_required([:users, :username, :email, :name])
  end
end

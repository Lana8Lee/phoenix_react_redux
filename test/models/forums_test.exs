defmodule PhoenixReactRedux.ForumsTest do
  use PhoenixReactRedux.ModelCase

  alias PhoenixReactRedux.Forums

  @valid_attrs %{email: "some content", name: "some content", username: "some content", users: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Forums.changeset(%Forums{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Forums.changeset(%Forums{}, @invalid_attrs)
    refute changeset.valid?
  end
end

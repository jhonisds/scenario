defmodule Scenario.AutomationsTest do
  use Scenario.DataCase

  alias Scenario.Automations

  describe "features" do
    alias Scenario.Automations.Feature

    @valid_attrs %{description: "some description", feature: "some feature"}
    @update_attrs %{description: "some updated description", feature: "some updated feature"}
    @invalid_attrs %{description: nil, feature: nil}

    def feature_fixture(attrs \\ %{}) do
      {:ok, feature} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Automations.create_feature()

      feature
    end

    test "list_features/0 returns all features" do
      feature = feature_fixture()
      assert Automations.list_features() == [feature]
    end

    test "get_feature!/1 returns the feature with given id" do
      feature = feature_fixture()
      assert Automations.get_feature!(feature.id) == feature
    end

    test "create_feature/1 with valid data creates a feature" do
      assert {:ok, %Feature{} = feature} = Automations.create_feature(@valid_attrs)
      assert feature.description == "some description"
      assert feature.feature == "some feature"
    end

    test "create_feature/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Automations.create_feature(@invalid_attrs)
    end

    test "update_feature/2 with valid data updates the feature" do
      feature = feature_fixture()
      assert {:ok, %Feature{} = feature} = Automations.update_feature(feature, @update_attrs)
      assert feature.description == "some updated description"
      assert feature.feature == "some updated feature"
    end

    test "update_feature/2 with invalid data returns error changeset" do
      feature = feature_fixture()
      assert {:error, %Ecto.Changeset{}} = Automations.update_feature(feature, @invalid_attrs)
      assert feature == Automations.get_feature!(feature.id)
    end

    test "delete_feature/1 deletes the feature" do
      feature = feature_fixture()
      assert {:ok, %Feature{}} = Automations.delete_feature(feature)
      assert_raise Ecto.NoResultsError, fn -> Automations.get_feature!(feature.id) end
    end

    test "change_feature/1 returns a feature changeset" do
      feature = feature_fixture()
      assert %Ecto.Changeset{} = Automations.change_feature(feature)
    end
  end
end

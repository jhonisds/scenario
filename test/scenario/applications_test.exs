defmodule Scenario.ApplicationsTest do
  use Scenario.DataCase

  alias Scenario.Applications

  describe "features" do
    alias Scenario.Applications.Feature

    @valid_attrs %{feature: "some feature", scenario: "some scenario", status: "some status"}
    @update_attrs %{feature: "some updated feature", scenario: "some updated scenario", status: "some updated status"}
    @invalid_attrs %{feature: nil, scenario: nil, status: nil}

    def feature_fixture(attrs \\ %{}) do
      {:ok, feature} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Applications.create_feature()

      feature
    end

    test "list_features/0 returns all features" do
      feature = feature_fixture()
      assert Applications.list_features() == [feature]
    end

    test "get_feature!/1 returns the feature with given id" do
      feature = feature_fixture()
      assert Applications.get_feature!(feature.id) == feature
    end

    test "create_feature/1 with valid data creates a feature" do
      assert {:ok, %Feature{} = feature} = Applications.create_feature(@valid_attrs)
      assert feature.feature == "some feature"
      assert feature.scenario == "some scenario"
      assert feature.status == "some status"
    end

    test "create_feature/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Applications.create_feature(@invalid_attrs)
    end

    test "update_feature/2 with valid data updates the feature" do
      feature = feature_fixture()
      assert {:ok, %Feature{} = feature} = Applications.update_feature(feature, @update_attrs)
      assert feature.feature == "some updated feature"
      assert feature.scenario == "some updated scenario"
      assert feature.status == "some updated status"
    end

    test "update_feature/2 with invalid data returns error changeset" do
      feature = feature_fixture()
      assert {:error, %Ecto.Changeset{}} = Applications.update_feature(feature, @invalid_attrs)
      assert feature == Applications.get_feature!(feature.id)
    end

    test "delete_feature/1 deletes the feature" do
      feature = feature_fixture()
      assert {:ok, %Feature{}} = Applications.delete_feature(feature)
      assert_raise Ecto.NoResultsError, fn -> Applications.get_feature!(feature.id) end
    end

    test "change_feature/1 returns a feature changeset" do
      feature = feature_fixture()
      assert %Ecto.Changeset{} = Applications.change_feature(feature)
    end
  end
end

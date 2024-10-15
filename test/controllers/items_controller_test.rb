require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url, as: :json
    assert_response :success
    result = @response.parsed_body
    # assert_equal items(:one).name, result[0]["name"]
    # assert_equal items(:one).weight, result[0]["weight"]
    # assert_equal items(:one).container, result[0]["container"]
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: {
        name: "red blue",
        weight: 500,
        container: 10
      } }, as: :json
    end

    assert_response :created
  end

  test "should show item" do
    get item_url(@item), as: :json
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: {
      name: "blue red",
      id: @item.id
    } }, as: :json
    assert_response :success
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item), as: :json
    end

    assert_response :no_content
  end
end

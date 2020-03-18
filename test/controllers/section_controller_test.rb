require 'test_helper'

class SectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get section_index_url
    assert_response :success
  end

  test "should get new" do
    get section_new_url
    assert_response :success
  end

  test "should get show" do
    get section_show_url
    assert_response :success
  end

  test "should get edit" do
    get section_edit_url
    assert_response :success
  end

  test "should get delete" do
    get section_delete_url
    assert_response :success
  end

end

# frozen_string_literal: true

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "the name of category shall exist" do
    new_category = Category.new
    assert_not new_category.save, "Saving a category without name"
  end

  test "the name of category shall be longer than 5" do
    new_category = Category.new
    new_category.name = "cik"
    assert_not new_category.save, "Saving a category with a silly name"
  end

  test "the name of category shall be shorter than 20 chars" do
    new_category = Category.new
    new_category.name = "Thine hope, thine suffer and my eternal emotions when I missed you"
    assert_not new_category.save, "Trying to save a Gothic Metal band name as a Category name"
  end

  test "the category shall be saved if there is valid name" do
    new_category = Category.new
    new_category.name = "Cuties"
    assert new_category.save, "Don't save the valid category"
  end
end

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do

  	get root_url
  	assert_template 'home/top'
  	assert_select "a[href=?]", root_url


  end

end

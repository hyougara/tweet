require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:yuki)
    @non_admin = users(:maeda)
  end

  test "index including pagination" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    # assert_select 'div.paginate'
    # User.pag(page: 1).each do |user|
    #   assert_select 'a[href=?]', user_path(user), text: user.name
    # end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

end

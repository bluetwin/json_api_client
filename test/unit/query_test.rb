require 'test_helper'

class QueryTest < MiniTest::Unit::TestCase

  def test_find_query_with_params
    query = JsonApiClient::Query::Find.new(User, {foo: "bar", qwer: "asdf"})
    assert_equal :get, query.request_method
    assert_equal({foo: "bar", qwer: "asdf"}, query.params)
    assert_equal "users", query.path
  end

  def test_find_by_id
    query = JsonApiClient::Query::Find.new(User, 1)
    assert_equal :get, query.request_method
    assert_equal nil, query.params
    assert_equal "users/1", query.path
  end

  def test_find_by_primary_keys
    query = JsonApiClient::Query::Find.new(User, [2,3])
    assert_equal :get, query.request_method
    assert_equal({id: [2,3]}, query.params)
    assert_equal "users", query.path
  end

  def test_find_by_different_primary_keys
    assert_equal :user_id, UserPreference.primary_key
    query = JsonApiClient::Query::Find.new(UserPreference, [2,3])
    assert_equal :get, query.request_method
    assert_equal({user_id: [2,3]}, query.params)
    assert_equal "user_preferences", query.path
  end

  def test_update_query

  end

  def test_create_query

  end

  def test_destroy_query

  end

end
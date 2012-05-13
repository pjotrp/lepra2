# rake test, or
#
# ruby -I test test/functional/personal_histories_controller_test.rb 

require 'test_helper'

class PersonalHistoriesControllerTest < ActionController::TestCase
  test "create a new personal history" do
    post :create, :personal_history => 
      { :date => '10/10/2010', :registration => '112', :registration_date => '10/10/2010',
        :staff_id => 1 }
    personal_history = assigns(:personal_history)
    assert_not_nil personal_history
    assert personal_history.errors.count == 0
    assert_equal "Personal history was successfully created.", flash[:notice]
  end
end

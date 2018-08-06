# == Schema Information
#
# Table name: type_of_movements
#
#  id          :integer          not null, primary key
#  name        :string
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_type_of_movements_on_activity_id  (activity_id)
#

require 'test_helper'

class TypeOfMovementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: decisions
#
#  id               :integer          not null, primary key
#  project_id       :integer
#  collegial        :integer
#  type_decision_id :integer
#  date_d           :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class DecisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

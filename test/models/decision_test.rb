# == Schema Information
#
# Table name: decisions
#
#  id               :integer          not null, primary key
#  project_id       :integer
#  collegial_id     :integer
#  type_decision_id :integer
#  date_d           :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_decisions_on_collegial_id      (collegial_id)
#  index_decisions_on_project_id        (project_id)
#  index_decisions_on_type_decision_id  (type_decision_id)
#

require 'test_helper'

class DecisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

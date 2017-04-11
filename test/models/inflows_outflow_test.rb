# == Schema Information
#
# Table name: inflows_outflows
#
#  id          :integer          not null, primary key
#  movement_id :integer
#  project_id  :integer
#  total       :decimal(, )
#  date_f      :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class InflowsOutflowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

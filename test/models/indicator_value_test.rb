# == Schema Information
#
# Table name: indicator_values
#
#  id           :integer          not null, primary key
#  project_id   :integer
#  indicator_id :integer
#  date_i       :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class IndicatorValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

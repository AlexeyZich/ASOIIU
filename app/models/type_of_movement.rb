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

class TypeOfMovement < ApplicationRecord
  belongs_to :activity, class_name: "TypeOfActivity"
  has_many :inflows_outflows, foreign_key: 'movement_id'
end

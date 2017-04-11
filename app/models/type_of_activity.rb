# == Schema Information
#
# Table name: type_of_activities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypeOfActivity < ApplicationRecord
  has_many :type_of_movements
end

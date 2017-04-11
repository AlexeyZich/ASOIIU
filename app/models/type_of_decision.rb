# == Schema Information
#
# Table name: type_of_decisions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypeOfDecision < ApplicationRecord
  has_many :decisions
end

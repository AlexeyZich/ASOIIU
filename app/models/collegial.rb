# == Schema Information
#
# Table name: collegials
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collegial < ApplicationRecord
  has_many :decisions
end

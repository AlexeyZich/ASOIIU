# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  currency   :string
#  date_p     :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  has_many :inflows_outflows
  has_many :indicator_values
  has_many :decisions
end

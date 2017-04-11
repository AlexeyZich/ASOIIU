# == Schema Information
#
# Table name: financial_indicators
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FinancialIndicator < ApplicationRecord
  has_many :indicator_values
end

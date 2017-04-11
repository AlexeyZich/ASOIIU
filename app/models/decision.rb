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

class Decision < ApplicationRecord
  belongs_to :project
  belongs_to :type_decision, class_name: "TypeOfDecision"
  belongs_to :collegial
end

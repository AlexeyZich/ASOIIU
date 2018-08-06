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

class Decision < ApplicationRecord
  belongs_to :project
  belongs_to :type_decision, class_name: "TypeOfDecision"
  belongs_to :collegial
end

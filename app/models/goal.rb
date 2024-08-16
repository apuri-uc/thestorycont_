# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  g1         :string
#  g2         :string
#  g3         :string
#  g4         :string
#  g5         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
has_many  :days, class_name: "Day", foreign_key: "goal_id", dependent: :destroy
end

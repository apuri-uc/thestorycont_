# == Schema Information
#
# Table name: days
#
#  id          :bigint           not null, primary key
#  day         :string
#  entries     :string
#  g1          :string
#  g1_workedon :string
#  g2          :string
#  g2_workedon :string
#  g3          :string
#  g3_workedon :string
#  g4          :string
#  g4_workedon :string
#  g5          :string
#  g5_workedon :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  goal_id     :integer
#  user_id     :integer
#  week_id     :integer
#
class Day < ApplicationRecord
end

# == Schema Information
#
# Table name: reflection_questions
#
#  id         :bigint           not null, primary key
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  day_id     :integer
#
class ReflectionQuestion < ApplicationRecord
belongs_to :day, required: true, class_name: "Day", foreign_key: "day_id"
end

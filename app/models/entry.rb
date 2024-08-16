# == Schema Information
#
# Table name: entries
#
#  id          :bigint           not null, primary key
#  daily_entry :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  day_id      :integer
#  user_id     :integer
#
class Entry < ApplicationRecord
belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
belongs_to :day, required: true, class_name: "Day", foreign_key: "day_id"
end

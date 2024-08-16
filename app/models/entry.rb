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
end

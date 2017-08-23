class Group < ApplicationRecord
  belongs_to :matter
  belongs_to :semester
  has_one :ficha
  has_and_belongs_to_many :schedules

  def code_with_group
    "#{name} -  #{matter.code}"
  end

end

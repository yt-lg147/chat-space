class Group < ApplicationRecord
  validates :group_name, presence: true , uniqueness: true
  validates :user_ids, presence: true
  has_many :members
  has_many :users, through: :members
  has_many :messages
end

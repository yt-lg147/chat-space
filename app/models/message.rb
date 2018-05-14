class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  def japan_time(created_at)
    t1 = created_at + 9.hours
    t2 = t1.strftime('%Y/%m/%d %H:%M:%S')
    return t2
  end
end

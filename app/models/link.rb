class Link < ApplicationRecord
  scope :recent_first, -> { order(created_at: :desc) }
  validates :url, presence: true

 def to_param
   ShortCode.encode(id)
 end

end

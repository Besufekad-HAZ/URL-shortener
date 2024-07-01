class Link < ApplicationRecord
  belongs_to :user, optional: true
  has_many :views, dependent: :destroy

  scope :recent_first, -> { order(created_at: :desc) }

  validates :url, presence: true

  after_save_commit if: :url_previously_changed? do
    MetadataJob.perform_later(to_param)
  end

  def self.find(id)
   super ShortCode.decode(id)
  end
 def to_param
   ShortCode.encode(id)
 end

 def domain
  URI(url).host rescue StandardError URI::InvalidURIError
 end

 def editable_by?(user)
  user == self.user
 end

end

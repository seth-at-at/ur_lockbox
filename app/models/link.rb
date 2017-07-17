class Link < ApplicationRecord
  validates :url, :title, presence: true
  belongs_to :user

  validates_uniqueness_of :url, scope: :user_id
end

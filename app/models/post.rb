class Post < ApplicationRecord
  POST_TYPE = 'post'.freeze
  PAGE_TYPE = 'page'.freeze

  PUBLISHED_STATUS = 'published'.freeze
  UNPUBLISHED_STATUS = 'draft'.freeze

  scope :published, -> { where(status: PUBLISHED_STATUS) }
  scope :posts, -> { where(type: POST_TYPE) }
  scope :order_by_published, -> { order(published_at: :desc) }
  
  self.inheritance_column = nil
end

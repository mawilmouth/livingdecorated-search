class Post < ApplicationRecord
  POST_TYPE = 'post'.freeze
  PAGE_TYPE = 'page'.freeze

  PUBLISHED_STATUS = 'published'.freeze
  UNPUBLISHED_STATUS = 'draft'.freeze

  scope :published, -> { where(status: PUBLISHED_STATUS) }
  
  self.inheritance_column = nil
end

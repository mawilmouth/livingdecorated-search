FactoryBot.define do
  factory :post, class: 'Post' do
    sequence(:id) { |n| "post-id-#{n}" }
    sequence(:uuid) { |n| "post-uuid-#{n}" }
    sequence(:title) { |n| "post-title-#{n}" }
    sequence(:slug) { |n| "post-slug-#{n}" }
    sequence(:created_by) { |n| "author-name-#{n}" }
    sequence(:author_id) { |n| n }

    trait :as_page do
      type { Post::PAGE_TYPE }
    end

    trait :published do
      status { Post::PUBLISHED_STATUS }
    end
  end
end

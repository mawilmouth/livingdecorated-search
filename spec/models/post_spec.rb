require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'scopes' do
    describe '#published' do
      let!(:post_one) { create(:post, :published) }
      let!(:post_two) { create(:post) }
      let!(:post_three) { create(:post, :published) }

      it 'returns the expected posts' do
        expect(described_class.published).to match_array [post_one, post_three]
      end
    end

    describe '#posts' do
      let!(:post_one) { create(:post, :as_page) }
      let!(:post_two) { create(:post) }
      let!(:post_three) { create(:post) }

      it 'returns the expected posts' do
        expect(described_class.posts).to match_array [post_two, post_three]
      end
    end

    describe '#order_by_published' do
      let!(:post_one) { create(:post, published_at: Time.current - 1.day) }
      let!(:post_two) { create(:post, published_at: Time.current) }
      let!(:post_three) { create(:post, published_at: Time.current - 2.days) }

      it 'returns the posts in the expected order' do
        result = described_class.order_by_published
        expect(result[0]).to eq post_two
        expect(result[1]).to eq post_one
        expect(result[2]).to eq post_three
      end
    end
  end
end

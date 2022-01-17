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
  end
end

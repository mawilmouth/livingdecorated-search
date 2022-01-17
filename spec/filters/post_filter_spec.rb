require 'rails_helper'

RSpec.describe PostFilter, type: :filter do
  def call(*args)
    described_class.call(*args)
  end

  describe '#call' do
    let(:instance) { double(filter: nil) }

    before { allow(described_class).to receive(:new).and_return(instance) }

    before(:each) { call('arg1', 'arg2') }

    it 'creates a new instance of the class and calls the filter method' do
      expect(described_class).to have_received(:new).once
    end

    it 'calls the filter method with the passed args' do
      expect(instance).to have_received(:filter).once.with('arg1', 'arg2')
    end
  end

  describe 'filter' do
    let!(:post_one) { create(:post, title: 'test') }
    let!(:post_two) { create(:post, :published, title: 'test') }
    let!(:post_three) { create(:post, :published, title: 'hello world') }
    let(:mock_collection) { double(where_like: nil) }

    it 'passes the expected params to where_like' do
      call(mock_collection, 'test query')
      expect(mock_collection).to have_received(:where_like).once.with(
        [:title, :slug, :plaintext, :custom_excerpt] => ['test', 'query']
      )
    end

    it 'returns the expected posts' do
      result = call(Post.all, 'test')
      expect(result).to match_array [post_one, post_two]
    end

    it 'can be scoped' do
      result = call(Post.published, 'test')
      expect(result).to match_array [post_two]
    end
  end
end

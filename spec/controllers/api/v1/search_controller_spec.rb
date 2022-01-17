require 'rails_helper'

module Api::V1
  RSpec.describe SearchController, type: :controller do
    def json_response
      JSON.parse(response.body)
    end

    describe '#index' do
      let!(:posts) { create_list(:post, 15, :published, title: '9876') }
      let!(:post_one) { create(:post, title: 'test') }
      let!(:post_two) { create(:post, :published, title: '1234') }

      before { get :index, params: { q: '9876' } }

      context 'bad request' do
        before { get :index }

        it 'returns 400 bad request' do
          expect(response).to have_http_status(:bad_request)
        end
      end

      it 'returns 200 success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns an array of posts' do
        expect(json_response).to be_a(Array)
      end

      it 'returns the expected data' do
        expect(json_response.first.keys).to match_array(
          %w[
            id title slug mobiledoc html comment_id plaintext feature_image
            uuid featured type status locale visibility email_recipient_filter
            author_id created_at created_by updated_at updated_by published_at published_by
            custom_excerpt codeinjection_head codeinjection_foot custom_template canonical_url
          ]
        )
      end

      it 'returns the expected amount of posts' do
        expect(json_response.size).to eq 10
      end

      context 'passing the fields param' do
        before { get :index, params: { q: '9876', fields: 'id,slug,title' } }

        it 'returns the expected data' do
          expect(json_response.first.keys).to match_array %w[id slug title]
        end

        context 'requesting invalid field' do
          before { get :index, params: { q: '9876', fields: 'id,fake_field' } }

          it 'returns 400 bad request' do
            expect(response).to have_http_status(:bad_request)
          end
        end
      end
    end
  end
end

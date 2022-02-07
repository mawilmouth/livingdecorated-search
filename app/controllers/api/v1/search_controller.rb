module Api::V1
  class SearchController < ApplicationController
    before_action :validate_query!, :validate_fields!
  
    def index
      render json: posts_by_query, **rendering_options
    end
  
    private

    def post_has_field?(field_name)
      Post.column_names.include? field_name
    end
  
    def query
      params[:q]
    end
  
    # EX: 'id,slug,title'
    def fields
      params[:fields]
    end

    def fields_array
      fields.split(',')
    end
  
    def rendering_options
      options = {}
  
      options[:only] = fields_array if fields.present?
  
      options
    end
  
    def posts
      return @posts if defined? @posts

      @posts = Post.published

      @posts = rendering_options[:only].present? ?
        posts.select(rendering_options[:only]) : posts
    end
  
    def posts_by_query
      @posts ||= PostFilter.call(posts, query)
    end
  
    def validate_query!
      bad_request unless query.present?
    end

    def validate_fields!
      return unless fields.present?

      fields_array.each { |field| bad_request unless post_has_field? field }
    end
  end
end

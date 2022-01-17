class PostFilter
  include Minidusen::Filter

  filter :text do |scope, phrases|
    columns = %i[title slug plaintext custom_excerpt]
    scope.where_like(columns => phrases)
  end

  def self.call(*args)
    new.filter(*args)
  end
end

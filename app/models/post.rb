class Post < ActiveRecord::Base
  validates :title, :author, :body, {:presence => true}
end

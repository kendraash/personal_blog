class Post < ActiveRecord::Base
  validates :title, :author, :body, {:presence => true}
  belongs_to :tag
end

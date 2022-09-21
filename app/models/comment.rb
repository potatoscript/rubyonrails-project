class Comment < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_rich_text :body
end

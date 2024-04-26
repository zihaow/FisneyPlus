class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :show_id, uniqueness: { scope: :user_id, message: "Show already been favorited" }
end

class Show < ApplicationRecord
  has_many :show_categories
  has_many :categories, through: :show_categories

  has_many :favorites
  has_many :users, through: :favorites

  enum show_type: {
    movie: 0,
    tv: 1,
  }

  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") if name.present? }
  scope :by_year, ->(year) { where(year: year) if year.present? }
  scope :by_show_type, ->(show_type) { where(show_type: show_type) if show_type.present? }
  scope :by_genres, ->(genres) { includes(:categories).where(categories: { name: genres }) if genres.present? }
  scope :by_year_range, ->(start_year, end_year) { where(year: start_year..end_year) if start_year.present? && end_year.present? }
end

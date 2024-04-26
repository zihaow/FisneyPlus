# frozen_string_literal: true

class ShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :genres, :show_type, :year, :detail

  def genres
    object.categories.pluck(:name)
  end
end

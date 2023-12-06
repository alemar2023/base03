class Area < ApplicationRecord

  has_many :brands
  has_many :area_labels
  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body
  has_one :en_area, -> { where(locale: "en")} , class_name: "AreaLabel"
  accepts_nested_attributes_for :area_labels
  def image_as_thumbnail
    image.variant(resize_to_limit:[150, 150]).processed
  end
  def pictures_as_thumbanails
    pictures.map do |picture|
      picture.variant(resize_to_limit: [100, 100]).processed
    end
  end
end

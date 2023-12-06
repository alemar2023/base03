include LocalesHelper
class BrandLabel < ApplicationRecord
  belongs_to :brand

  enum locale: all_locales.index_by(&:itself), _prefix: :locale
  validates :name , :locale , presence: true
  validates :locale, :uniqueness => {scope: :name}

end


include LocalesHelper
class AreaLabel < ApplicationRecord
  belongs_to :area

  enum locale: all_locales.index_by(&:itself), _prefix: :locale
  validates :name , :locale , presence: true
  validates :locale, :uniqueness => {scope: :name}

end


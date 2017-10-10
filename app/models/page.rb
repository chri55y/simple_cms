class Page < ApplicationRecord

  belongs_to :subject, {:optional => true}
  has_many :sections
end
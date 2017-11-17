class Subject < ApplicationRecord

  has_many :pages

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }

  # simple validation, to trigger form error handling
  # from ch 11.4
  validates_presence_of :name

  # further validations added in ch 12.2
  validates_length_of :name, :maximum => 255 # DB requirement

end

class Section < ApplicationRecord

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :position_sorted, lambda {order("position ASC")}

  # validations added in ch 12.2
  CONTENT_TYPES = ['text','HTML'] #

  validates_presence_of   :name
  validates_length_of     :name, :maximum => 255
  #validates_inclusion_of  :content_type

end

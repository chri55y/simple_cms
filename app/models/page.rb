class Page < ApplicationRecord

  belongs_to :subject, {:optional => true}
  has_many :sections
  has_and_belongs_to_many :admin_users

  # add scopes
  # (videos do not include this step for Page)
  scope :position_sorted , lambda {order("position ASC")}


  # validations added in ch 12.2
  validates_presence_of :name
  validates_length_of :name, :maximum => 255 # DB requirement

  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink

end
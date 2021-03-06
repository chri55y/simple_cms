class AdminUser < ApplicationRecord


  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  # "long form" validations
  # validates_presence_of :first_name
  # validates_length_of :first_name, :maximum => 25
  # validates_presence_of :last_name
  # validates_length_of :last_name, :maximum => 50
  # validates_presence_of :username
  # validates_length_of :username, :within => 8..25
  # validates_uniqueness_of :username
  # validates_presence_of :email
  # validates_length_of :email, :maximum => 100
  # validates_format_of :email, :with => EMAIL_REGEX
  # validates_confirmation_of :email

  # "sexy" validations (12.3)
  validates :first_name,  :presence => true,
                          :length => { :maximum => 25}
  validates :last_name, :presence => true,
                        :length => { :maximum => 50}
  validates :username,  :length => {:within => 8..25},
                        :uniqueness => true
  validates :email, :presence => true,
                    :length => {:maximum => 100},
                    :format => EMAIL_REGEX,
                    :confirmation => true

  # custom validations (12.4)
  FORBIDDEN_USERNAMES = ['marymary','littlebopeep','humpty_dumpty']

  validate :username_is_allowed
  validate :no_new_users_on_day, :on => :create

  private

  def username_is_allowed
    if FORBIDDEN_USERNAMES.include?(username)
      errors.add(:username, "is not allowed")
    end
  end

  def no_new_users_on_day
    day = Time.now.wday
    if Time.now.wday == day
      errors.add(:base, "No new users today")
                # error messages off :base do not get
                # concatenated with attribute name
    end
  end

end

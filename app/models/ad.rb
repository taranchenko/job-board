class Ad < ActiveRecord::Base
  belongs_to :user
  has_many :replies

  validates_presence_of :title, :company, :description
  validates_associated :user

  self.per_page = 25
end

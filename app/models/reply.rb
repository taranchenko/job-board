class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :ad

  validates_presence_of :body

  self.per_page = 25
end
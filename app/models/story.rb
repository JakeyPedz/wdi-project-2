class Story < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :categories
end

class Note < ApplicationRecord
  validates :body, presence: true
  has_and_belongs_to_many :users
end

class User < ApplicationRecord
  validates :name, :email, presence: true
  has_and_belongs_to_many :notes

  accepts_nested_attributes_for :notes, allow_destroy: true
end

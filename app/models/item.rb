class Item < ActiveRecord::Base
  validates :what, presence: true
end

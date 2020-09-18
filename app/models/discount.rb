class Discount < ApplicationRecord
  belongs_to :item

  validates_presence_of :name,
                        :quantity,
                        :percentage
end

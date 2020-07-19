class Company < ApplicationRecord
  has_rich_text :description
  validates :email, email: true, allow_blank: true
end

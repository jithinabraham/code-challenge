class Company < ApplicationRecord
  has_rich_text :description
  validates :email, email: true, allow_blank: true
  validates :zip_code, zip_code: true, allow_blank: true

  before_save :set_state_and_city, if: :zip_code

  private

  def set_state_and_city
    zip_code_details = ZipCodes.identify(zip_code)
    self.city = zip_code_details[:city]
    self.state = zip_code_details[:state_code]
  end
end

module CompanyHelper
	
	def city_state_label(company)
		return unless company.zip_code
		"#{company.city}, #{company.state}"
	end
end
class ZipCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    return if ZipCodes.identify(record[attribute]).present?

    record.errors.add(attribute, :invalid_zip_code)
  end
end

class EmailValidator < ActiveModel::EachValidator
  EMAIL_FORMAT = /[a-zA-Z0-9._%+-]+@getmainstreet.com/.freeze

  def validate_each(record, attribute, _value)
    return if record[attribute]&.match?(EMAIL_FORMAT)

    record.errors.add(attribute, :invalid_email_format)
  end
end

class DateFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    Date.strptime(value, '%d/%m/%Y')
  rescue
    record.errors[attribute] << (options[:message] || 'is not an valid date, use format dd/mm/yyyy')
  end
end

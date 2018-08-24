class StampExpiredValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if Date.current > record.fecha_expiracion
      record.errors.add(attribute, :timbrado_id, options.merge(:value => value))
    end
  end
end
# This allows us to assign the validator in the model
module ActiveModel::Validations::HelperMethods
  def validates_stamp_expired(*attr_names)
    validates_with StampExpiredValidator, _merge_attributes(attr_names)
  end
end
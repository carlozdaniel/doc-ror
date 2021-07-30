class PhotoValidator < ActiveModel::Validator
  def validate(record)
    for badword in BADWORDS do
      if record.description.downcase.include?(badword.downcase)
        record.errors.add(:description, 'la palabra'+badword+'no esta permitida')
      end
    end
  end
end
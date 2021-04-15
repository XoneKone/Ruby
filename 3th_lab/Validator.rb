module Validator
  def self.is_russian_mobphone?(mobphone)
    (/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/ =~ mobphone) != nil
  end

  def self.to_valid_mobphone(mobphone)
    raise ArgumentError, 'Неправильный номер' unless is_russian_mobphone? mobphone

    mobphone.gsub('-', '').gsub('(', '').gsub(')', '').gsub(' ', '').gsub('+', '').insert(1, '-').insert(5, '-')
  end

  def self.is_email?(email)
    (/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ =~ email) != nil
  end

  def self.to_valid_email(email)
    raise ArgumentError, 'Неправильный email' unless is_email? email

    email.downcase
  end

  def self.is_fullname?(fullname)
    (/[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[А-Я][а-я]*(\s[а-яА-Я]*)?$/ =~ fullname.rstrip.lstrip) != nil && fullname[/[0-9a-zA-Z]/] == nil
  end

  def self.to_valid_fullname(fullname)
    raise ArgumentError, 'Неправильное ФИО' unless is_fullname? fullname

    name = fullname.lstrip.rstrip[/[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[А-Я][а-я]*(\s[а-яА-Я]*)?$/].gsub(/\s[-]\s/, '-').split
    name.map! { |e| e[/[-]/] == nil ? e.capitalize : e.split('-').map! { |k| k.capitalize }.join('-') }
    if name.length == 4
      name[-1].downcase!
    end

    name.join(' ')
  end

  def self.is_birthdate?(birthdate)
    (/^([0-2]\d|3[0-1]|\d)\.(0[1-9]|1[0-2])\.(\d{2}|\d{4})$/ =~ birthdate) != nil
  end

  def self.to_valid_birthdate(birthdate)
    raise ArgumentError, 'Неправильный формат даты' unless is_birthdate? birthdate
    unless birthdate[/.\d{4}/] == nil
      return DateTime.strptime(birthdate, '%d.%m.%Y').strftime('%d.%m.%Y')
    end

    DateTime.strptime(birthdate, '%d.%m.%y').strftime('%d.%m.%Y')
  end

  def self.is_passport?(passport)
    (/^([0-9]{10})$/ =~ passport.gsub(' ', '')) != nil
  end

  def self.to_valid_passport(passport)
    raise ArgumentError, 'Неправильный номер паспорта' unless is_passport? passport

    passport.gsub(' ', '').insert(2, ' ').insert(5, ' ')
  end
end
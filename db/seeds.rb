countries = [['Russia', 'Россия'],
             ['Belarus', 'Беларусь'],
             ['Czech Republic', 'Чехия'],
             ['Sweden', 'Швеция'],
             ['Canada', 'Канада'],
             ['Switzerland', 'Швейцария'],
             ['France', 'Франция']]

countries.each do |name_en, name_ru|
  Team.find_or_create_by(name_en: name_en, name_ru: name_ru)
end

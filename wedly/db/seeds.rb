12.times do |e|
e = Event.create!({
      :address_line_1 => Faker::Address.street_address,
      :address_line_2 => Faker::Address.secondary_address,
      :city => Faker::Address.city,
      :province => Faker::Address.state_abbr,
      :zip => Faker::Address.zip_code,
      :country => Faker::Address.country
    }
  )
end
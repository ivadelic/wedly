Event.destroy_all
12.times do |e|
e = Event.create!({
      :name => "The ceremony of " + Faker::Name.name + " and " + Faker::Name.name,
      :date => "September, 3, 2090",
      :start_time => "6:00",
      :end_time => "12:00",
      :address_line_1 => Faker::Address.street_address,
      :address_line_2 => Faker::Address.secondary_address,
      :city => Faker::Address.city,
      :province => Faker::Address.state_abbr,
      :zip => Faker::Address.zip_code,
      :country => Faker::Address.country
    }
  )
end
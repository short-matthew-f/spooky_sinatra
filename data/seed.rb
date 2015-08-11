require 'faker'
require 'json'

users = []
users_file = File.new("users.json", "w")

def make_user
  # let's let users have up to four addresses total
  user_addresses = []
  num_addresses = 1 + rand(3)


  num_addresses.times do
    user_addresses.push({
      street_address: Faker::Address.street_address,
      city:           Faker::Address.city,
      state:          Faker::Address.state,
      zipcode:        Faker::Address.zip
    })
  end

  return {
    name:   Faker::Name.name,
    email:  Faker::Internet.email,
    addresses: user_addresses,
    employer: {
      name:          [Faker::Company.name, Faker::Company.suffix].join(' '),
      motto:          Faker::Company.catch_phrase,
      logo_url:       "http://lorempixel.com/240/160"
    }
  }
end

30.times { users << make_user }

users_file.puts(users.to_json)
users_file.close

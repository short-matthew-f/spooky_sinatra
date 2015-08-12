require 'faker'
require 'json'

banks = []
banks_file = File.new("banks.json", "w")

def make_bank
  bank_name = Faker::Company.name
  bank_email = "info@" + bank_name.gsub(/\s/, '_').gsub(/\W+/, '').downcase + ".com"

  net_worth = "$" + (0..(8 + rand(5)))
                      .map { (1..9).to_a.sample }
                      .each_slice(3)
                      .to_a
                      .reverse
                      .map { |x| x.join('') }
                      .join(',')

  return {
    name:             bank_name,
    email:            bank_email,
    street_address:   Faker::Address.street_address,
    city:             Faker::Address.city,
    state:            Faker::Address.state,
    zipcode:          Faker::Address.zip,
    current_holdings: net_worth
  }
end

30.times { banks << make_bank }

banks_file.puts(banks.to_json)
banks_file.close

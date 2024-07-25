# Limpa todos os dados existentes
Country.destroy_all

# Array de países fictícios usando Faker
countries = [
  { name: 'Brazil', capital: 'Brasília', population: Faker::Number.within(range: 1000000..200000000), area: Faker::Number.within(range: 100000..10000000) },
  { name: 'United States', capital: 'Washington, D.C.', population: Faker::Number.within(range: 1000000..200000000), area: Faker::Number.within(range: 100000..10000000) },
  { name: 'India', capital: 'New Delhi', population: Faker::Number.within(range: 1000000..200000000), area: Faker::Number.within(range: 100000..10000000) },
  { name: 'France', capital: 'Paris', population: Faker::Number.within(range: 1000000..200000000), area: Faker::Number.within(range: 100000..10000000) },
  { name: 'Italy', capital: 'Roma', population: Faker::Number.within(range: 1000000..200000000), area: Faker::Number.within(range: 100000..10000000) },
  { name: 'Argentina', capital: 'Bueonos Aires', population: Faker::Number.within(range: 1000000..200000000), area: Faker::Number.within(range: 100000..10000000) },

]

# Cria os países no banco de dados
countries.each do |country|
  Country.create!(country)
end

puts 'Countries seeded successfully!'
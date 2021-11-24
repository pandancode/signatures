# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 0. Cleaning DB
puts "Cleaning DB..."
puts "Deleting all existing signatories..."
Signatory.delete_all
puts "Deleting all existing signatories: done"
puts "Deleting all existing contracts..."
Contract.delete_all
puts "Deleting all existing contracts: done"
puts "Deleting all existing individuals..."
Individual.delete_all
puts "Deleting all existing individuals: done"
puts "Deleting all existing companies..."
Company.delete_all
puts "Deleting all existing companies: done"
puts "Deleting all existing users..."
User.delete_all
puts "Deleting all existing users: done"
puts "Cleaning DB: done"

# 1. SEED 1: First unique company / 2 individual signatories pair
puts "Creating user 1 (company user)..."
user1 = User.new(role: "Company", email: "co1@co.com", password: "111111")
puts "Is this a valid user? #{user1.valid?}"
user1.save!
puts "Creating user 1 (company user): done"

puts "Creating user 2 (individual user)..."
user2 = User.new(role: "Individual", email: "u1@user.com", password: "111111")
puts "Is this a valid user? #{user2.valid?}"
user2.save!
puts "Creating user 2 (individual user): done"

puts "Creating user 3 (individual user)..."
user3 = User.new(role: "Individual", email: "u2@user.com", password: "111111")
puts "Is this a valid user? #{user3.valid?}"
user3.save!
puts "Creating user 3 (individual user): done"

# Creating a company (for user1)
# Create company 1
puts "Creating company 1 (for company user1)..."
company1 = Company.new(company_name: "Alpha", address: "1 Whitehall London SW1A 2DD", detail: "No further information", user_id: user1.id)
puts "Is this a valid company? #{company1.valid?}"
company1.save!
puts "Creating company 1 (for company user1): done"

# Create individual 2
puts "Creating individual 2 (for user2)..."
individual2 = Individual.new(title: "Ms", first_name: "Jacqueline", last_name: "Smith", phone_number: "0000000001",
                             birth_date: "1988/1/1", user_id: user2.id)
puts "Is this a valid individual? #{individual2.valid?}"
individual2.save!
puts "Creating individual 2 (for user2): done"

# Create individual 3
puts "Creating individual 3 (for user3)..."
individual3 = Individual.new(title: "Mr", first_name: "Jack", last_name: "Adams", phone_number: "0000000002",
                             birth_date: "1989/1/1", user_id: user3.id)
puts "Is this a valid individual? #{individual3.valid?}"
individual3.save!
puts "Creating individual 3 (for user3): done"

# Company 1 creates contract 1
puts "Creating contract 1 (for company 1)..."
contract1 = Contract.new(company_id: company1.id, fully_signed_at: nil)
puts "Is this a valid contract? #{contract1.valid?}"
contract1.save!
puts "Creating contract 1 (for company 1): done"

# Contract 1 creates signatories 1 & signatories 2
puts "Creating signatories 1 (for contract 1)..."
signatory1 = Signatory.new(signing_status: false, contract_id: contract1.id, individual_id: individual2.id)
puts "Is this a valid signatory? #{signatory1.valid?}"
signatory1.save!
puts "Creating signatory 1 (for contract 1): done"

puts "Creating signatories 2 (for contract 1)..."
signatory2 = Signatory.new(signing_status: false, contract_id: contract1.id, individual_id: individual3.id)
puts "Is this a valid signatory? #{signatory2.valid?}"
signatory2.save!
puts "Creating signatory 2 (for contract 1): done"

# 2. SEED 2: Second company / 2 contracts / 2 sets of 2 individual signatories pairs
puts "Creating user 4 (company user)..."
user4 = User.new(role: "Company", email: "co2@co.com", password: "111111")
puts "Is this a valid company? #{user4.valid?}"
user4.save!
puts "Creating user 4 (company user): done"

puts "Creating user 5 (individual user)..."
user5 = User.new(role: "Individual", email: "u5@user.com", password: "111111")
puts "Is this a valid company? #{user5.valid?}"
user5.save!
puts "Creating user 5 (individual user): done"

# Creating a company (for user1)
# Create company 2
puts "Creating company 2 (for company user4)..."
company2 = Company.new(company_name: "Beta", address: "Westminster London SW1A 0AA", detail: "Parliament",
                       user_id: user4.id)
puts "Is this a valid company? #{company2.valid?}"
company2.save!
puts "Creating company 2 (for company user1): done"

# Create individual 5
puts "Creating individual 5 (for user5)..."
individual3 = Individual.new(title: "Ms", first_name: "Jacques", last_name: "Chirac", phone_number: "0000000003",
                             birth_date: "1987/1/1", user_id: user2.id)
puts "Is this a valid individual? #{individual3.valid?}"
individual3.save!
puts "Creating individual 2 (for user2): done"

# Company 2 creates contract 2
puts "Creating contract 2 (for company 2)..."
contract2 = Contract.new(company_id: company2.id, fully_signed_at: nil)
puts "Is this a valid contract? #{contract2.valid?}"
contract2.save!
puts "Creating contract 2 (for company 2): done"

# Contract 2 creates signatories 2 & signatories 3
puts "Creating signatories 1 (for contract 1)..."
signatory1 = Signatory.new(signing_status: false, contract_id: contract2.id, individual_id: individual2.id)
puts "Is this a valid signatory? #{signatory1.valid?}"
signatory1.save!
puts "Creating signatory 1 (for contract 1): done"

puts "Creating signatories 2 (for contract 1)..."
signatory2 = Signatory.new(signing_status: false, contract_id: contract2.id, individual_id: individual3.id)
puts "Is this a valid signatory? #{signatory2.valid?}"
signatory2.save!
puts "Creating signatory 2 (for contract 1): done"

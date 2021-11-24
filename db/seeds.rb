# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =================================================
# 0. Cleaning DB
puts "Cleaning DB..."
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

# =================================================
# 1. Seed first company
puts "Creating user 1 (company user)..."
user1 = User.new(role: "Company", email: "co1@co.com", password: "111111")
puts "Is this a valid user? #{user1.valid?}"
user1.save!
puts "Creating user 1 (company user): done"
puts " "

puts "Creating company 1 (for company user1)..."
company1 = Company.new(company_name: "Alpha", address: "1 Whitehall London SW1A 2DD", detail: "No further information", user_id: user1.id)
puts "Is this a valid company? #{company1.valid?}"
company1.save!
puts "Creating company 1 (for company user1): done"
puts " "

# 2. Seed first individual
puts "Creating user 2 (individual user)..."
user2 = User.new(role: "Individual", email: "u1@user.com", password: "111111")
puts "Is this a valid user? #{user2.valid?}"
user2.save!
puts "Creating user 2 (individual user): done"
puts " "

puts "Creating individual 1 (for user2)..."
individual2 = Individual.new(title: "Ms", first_name: "Jacqueline", last_name: "Smith", phone_number: "0000000001",
                             birth_date: "1988/1/1", user_id: user2.id)
puts "Is this a valid individual? #{individual2.valid?}"
individual2.save!
puts "Creating individual 2 (for user2): done"
puts " "

# 3. Seed third individual
puts "Creating user 3 (individual user)..."
user3 = User.new(role: "Individual", email: "u2@user.com", password: "111111")
puts "Is this a valid user? #{user3.valid?}"
user3.save!
puts "Creating user 3 (individual user): done"
puts " "

puts "Creating individual 2 (for user3)..."
individual3 = Individual.new(title: "Mr", first_name: "Jack", last_name: "Adams", phone_number: "0000000002",
                             birth_date: "1989/1/1", user_id: user3.id)
puts "Is this a valid individual? #{individual3.valid?}"
individual3.save!
puts "Creating individual 3 (for user3): done"
puts " "

# Company 1 creates contract 1
puts "Creating contract 1 (for company 1) for individual 1..."
contract1 = Contract.new(company_id: company1.id, fully_signed_at: nil, status: )
puts "Is this a valid contract? #{contract1.valid?}"
contract1.save!
puts "Creating contract 1 (for company 1): done"
puts " "

# =================================================
# 2. SEED 2: Second company / 2 contracts / 2 sets of 2 individual signatories pairs
puts "Creating user 4 (company user)..."
user4 = User.new(role: "Company", email: "co2@co.com", password: "111111")
puts "Is this a valid company? #{user4.valid?}"
user4.save!
puts "Creating user 4 (company user): done"
puts " "

puts "Creating user 5 (individual user)..."
user3 = User.new(role: "Individual", email: "u3@user.com", password: "111111")
puts "Is this a valid company? #{user3.valid?}"
user3.save!
puts "Creating user 5 (individual user): done"
puts " "

# Creating a company (for user1)
# Create company 2
puts "Creating company 2 (for company user4)..."
company2 = Company.new(company_name: "Beta", address: "Westminster London SW1A 0AA", detail: "Parliament",
                       user_id: user4.id)
puts "Is this a valid company? #{company2.valid?}"
company2.save!
puts "Creating company 2 (for company user1): done"

# Create individual 5
puts "Creating individual 5 (for user3)..."
individual3 = Individual.new(title: "Mr", first_name: "Jacques", last_name: "Chirac", phone_number: "0000000003",
                             birth_date: "1987/1/1", user_id: user2.id)
puts "Is this a valid individual? #{individual3.valid?}"
individual3.save!
puts "Creating individual 2 (for user2): done"

# 3. Creates a completed contract
# Company 2 creates contract 2
puts "Creating contract 2 (for company 2)..."
contract2 = Contract.new(company_id: company1.id, fully_signed_at: nil)
puts "Is this a valid contract? #{contract2.valid?}"
contract2.save!
puts "Creating contract 2 (for company 2): done"

# Contract 2 creates signatories 1 & signatories 2
puts "Creating signatories 1 (for contract 2)..."
signatory3 = Signatory.new(signing_status: false, contract_id: contract2.id, individual_id: individual2.id)
puts "Is this a valid signatory? #{signatory3.valid?}"
signatory3.save!
puts "Creating signatory 1 (for contract 2): done"

puts "Creating signatories 2 (for contract 2)..."
signatory4 = Signatory.new(signing_status: false, contract_id: contract2.id, individual_id: individual3.id)
puts "Is this a valid signatory? #{signatory4.valid?}"
signatory4.save!
puts "Creating signatory 2 (for contract 2): done"

# =================================================
# 4. Creates a completed contract
# Company 1 creates contract 3
puts "Creating contract 3 (for company 1)..."
contract3 = Contract.new(company_id: company2.id, fully_signed_at: nil)
puts "Is this a valid contract? #{contract3.valid?}"
contract3.save!
puts "Creating contract 2 (for company 2): done"

# Contract 3 creates signatories 2 & signatories 3
puts "Creating signatories 1 (for contract 1)..."
signatory5 = Signatory.new(signing_status: false, contract_id: contract3.id, individual_id: individual2.id)
puts "Is this a valid signatory? #{signatory5.valid?}"
puts "Signing..."
signatory5.signing_status = true
signatory5.save!
puts "Creating signed signatory 1 (for contract 3): done"

puts "Creating signatories 2 (for contract 1)..."
signatory6 = Signatory.new(signing_status: false, contract_id: contract3.id, individual_id: individual3.id)
puts "Is this a valid signatory? #{signatory6.valid?}"
puts "Signing..."
signatory6.signing_status = true
signatory6.save!
puts "Creating signed signatory 2 (for contract 3): done"

# Updating Contract 3's contract status
contract3.fully_signed_at = signatory6.updated_at
contract3.save!
puts "Updated contract 3 to be fully completed"

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
puts " "

# =================================================
# 1. Seed first company
puts "Creating user 1 (company user1)..."
user1 = User.new(role: "Company", email: "co1@co.com", password: "111111")
puts "Is this a valid user? #{user1.valid?}"
user1.save!
puts "Creating user 1 (company user1): done"
puts " "

puts "Creating company 1 (for company user1)..."
company1 = Company.new(company_name: "Alpha", address: "1 Whitehall London SW1A 2DD", detail: "No further information", user_id: user1.id)
puts "Is this a valid company? #{company1.valid?}"
company1.save!
puts "Creating company 1 (for company user1): done"
puts " "

# 2. Seed first individual
puts "Creating user 2 (individual user1)..."
user2 = User.new(role: "Individual", email: "u1@user.com", password: "111111")
puts "Is this a valid user? #{user2.valid?}"
user2.save!
puts "Creating user 2 (individual user1): done"
puts " "

puts "Creating individual 1 (for user2)..."
individual1 = Individual.new(title: "Ms", first_name: "Jacqueline", last_name: "Smith", phone_number: "0000000001",
                             birth_date: "1988/1/1", user_id: user2.id)
puts "Is this a valid individual? #{individual1.valid?}"
individual1.save!
puts "Creating individual 1 (for user2): done"
puts " "

# 3. Seed third individual
puts "Creating user 3 (individual user)..."
user3 = User.new(role: "Individual", email: "u2@user.com", password: "111111")
puts "Is this a valid user? #{user3.valid?}"
user3.save!
puts "Creating user 3 (individual user): done"
puts " "

puts "Creating individual 2 (for user3)..."
individual2 = Individual.new(title: "Mr", first_name: "Jack", last_name: "Adams", phone_number: "0000000002",
                             birth_date: "1989/1/1", user_id: user3.id)
puts "Is this a valid individual? #{individual2.valid?}"
individual2.save!
puts "Creating individual 2 (for user3): done"
puts " "

# 4. Company 1 creates contract 1 for individual 1
puts "Creating contract 1 (for company 1) for individual 1..."
contract1 = Contract.new(company_id: company1.id, individual_id: individual1.id, fully_signed_at: nil, status: "unopened")
puts "Is this a valid contract? #{contract1.valid?}"
contract1.save!
puts "Creating contract 1 (for company 1): done"
puts " "

# 5. Company 1 creates contract 2 for individual 2
puts "Creating contract 2 (for company 1) for individual 2..."
contract2 = Contract.new(company_id: company1.id, individual_id: individual2.id, fully_signed_at: nil, status: "unopened")
puts "Is this a valid contract? #{contract2.valid?}"
puts "Signing..."
contract4.fully_signed_at = Time.now
contract2.save!
puts "Creating contract 2 (for company 1): done"
puts " "

# =================================================

# 6. Seed second company
puts "Creating user 4 (company user)..."
user4 = User.new(role: "Company", email: "co2@co.com", password: "111111")
puts "Is this a valid user? #{user4.valid?}"
user4.save!
puts "Creating user 4 (company user): done"
puts " "

puts "Creating company 2 (for company user4)..."
company2 = Company.new(company_name: "Beta", address: "Westminster London SW1A 0AA", detail: "Parliament",
                       user_id: user4.id)
puts "Is this a valid company? #{company2.valid?}"
company2.save!
puts "Creating company 2 (for company user4): done"

# 7. Seed third individual
puts "Creating user 5 (individual user3)..."
user5 = User.new(role: "Individual", email: "u3@user.com", password: "111111")
puts "Is this a valid user? #{user5.valid?}"
user5.save!
puts "Creating user 5 (individual user3): done"
puts " "

puts "Creating individual 3 (for user2)..."
individual3 = Individual.new(title: "Ms", first_name: "Jacqueline", last_name: "Smith", phone_number: "0000000001",
                             birth_date: "1988/1/1", user_id: user5.id)
puts "Is this a valid individual? #{individual3.valid?}"
individual3.save!
puts "Creating individual 3 (for user2): done"
puts " "

# 8. Seed fourth individual
puts "Creating user 5 (individual user4)..."
user6 = User.new(role: "Individual", email: "u4@user.com", password: "111111")
puts "Is this a valid user? #{user6.valid?}"
user6.save!
puts "Creating user 5 (individual user4): done"
puts " "

puts "Creating individual 3 (for user2)..."
individual3 = Individual.new(title: "Ms", first_name: "Jacqueline", last_name: "Smith", phone_number: "0000000001",
                             birth_date: "1988/1/1", user_id: user5.id)
puts "Is this a valid individual? #{individual3.valid?}"
individual3.save!
puts "Creating individual 3 (for user2): done"
puts " "

# 9. Company 2 creates contract 3 for individual 3
puts "Creating contract 3 (for company 2) for individual 1..."
contract3 = Contract.new(company_id: company1.id, individual_id: individual1.id, fully_signed_at: nil, status: "unopened")
puts "Is this a valid contract? #{contract3.valid?}"
contract3.save!
puts "Creating contract 3 (for company 2): done"
puts " "

# 10. Company 2 creates contract 4 for individual 4
puts "Creating contract 4 (for company 2) for individual 2..."
contract4 = Contract.new(company_id: company1.id, individual_id: individual2.id, fully_signed_at: nil, status: "unopened")
puts "Is this a valid contract? #{contract4.valid?}"
puts "Signing..."
contract4.fully_signed_at = Time.now
contract4.save!
puts "Creating contract 4 (for company 2): done"
puts " "

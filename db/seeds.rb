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
# THEME: CREATION OF USERS + ASSOCIATED COMPANY / INDIVIDUAL
# 1. Seed first individual
puts "Creating user 1 (individual user1)..."
user1 = User.new(role: "Individual", email: "u1@user.com", password: "111111")
puts "Is this a valid user? #{user1.valid?}"
user1.save!
puts "Creating user 1 (individual user1): done"
puts " "

puts "Creating individual 1 (for user1)..."
individual1 = Individual.new(title: "Ms", first_name: "Anne", last_name: "Boleyn", phone_number: "0000000001",
                             birth_date: "1986/1/1", user_id: user1.id)
puts "Is this a valid individual? #{individual1.valid?}"
individual1.save!
puts "Creating individual 1 (for user1): done"
puts " "

# 2. Seed second individual
puts "Creating user 2 (individual user 2)..."
user2 = User.new(role: "Individual", email: "u2@user.com", password: "111111")
puts "Is this a valid user? #{user2.valid?}"
user2.save!
puts "Creating user 2 (individual user 2): done"
puts " "

puts "Creating individual 2 (for user2)..."
individual2 = Individual.new(title: "Mr", first_name: "Bart", last_name: "Chiswick", phone_number: "0000000002",
                             birth_date: "1987/1/1", user_id: user2.id)
puts "Is this a valid individual? #{individual2.valid?}"
individual2.save!
puts "Creating individual 2 (for user2): done"
puts " "

# 3. Seed third individual
puts "Creating user 3 (individual user3)..."
user3 = User.new(role: "Individual", email: "u3@user.com", password: "111111")
puts "Is this a valid user? #{user3.valid?}"
user3.save!
puts "Creating user 3 (individual user3): done"
puts " "

puts "Creating individual 3 (for user3)..."
individual3 = Individual.new(title: "Ms", first_name: "Charmaine", last_name: "Dickinson", phone_number: "0000000003",
                             birth_date: "1988/1/1", user_id: user3.id)
puts "Is this a valid individual? #{individual3.valid?}"
individual3.save!
puts "Creating individual 3 (for user3): done"
puts " "

# 4. Seed fourth individual
puts "Creating user 4 (individual user4)..."
user4 = User.new(role: "Individual", email: "u4@user.com", password: "111111")
puts "Is this a valid user? #{user4.valid?}"
user4.save!
puts "Creating user 4 (individual user4): done"
puts " "

puts "Creating individual 4 (for user4)..."
individual4 = Individual.new(title: "Mr", first_name: "Dustin", last_name: "Edwards", phone_number: "0000000004",
                             birth_date: "1989/1/1", user_id: user4.id)
puts "Is this a valid individual? #{individual4.valid?}"
individual4.save!
puts "Creating individual 4 (for user4): done"
puts " "

# 5. Seed first company
puts "Creating user 5 (company user1)..."
user5 = User.new(role: "Company", email: "co1@co.com", password: "111111")
puts "Is this a valid user? #{user5.valid?}"
user5.save!
puts "Creating user 5 (company user1): done"
puts " "

puts "Creating company 1 (for company user5)..."
company1 = Company.new(company_name: "Alpha", address: "1 Whitehall London SW1A 2DD", detail: "No further information", user_id: user5.id)
puts "Is this a valid company? #{company1.valid?}"
company1.save!
puts "Creating company 1 (for company user5): done"
puts " "

# 6. Seed second company
puts "Creating user 6 (company user)..."
user6 = User.new(role: "Company", email: "co2@co.com", password: "111111")
puts "Is this a valid user? #{user6.valid?}"
user6.save!
puts "Creating user 6 (company user): done"
puts " "

puts "Creating company 2 (for user6)..."
company2 = Company.new(company_name: "Beta", address: "Westminster London SW1A 0AA", detail: "Parliament",
                       user_id: user6.id)
puts "Is this a valid company? #{company2.valid?}"
company2.save!
puts "Creating company 2 (for user6): done"

# =================================================

# 7. Company 1 creates contract 1 for individual 1
puts "Creating contract 1 (for company 1) for individual 1..."
contract1 = Contract.new(company_id: company1.id, individual_id: individual1.id, email: individual1.user.email, fully_signed_at: nil, status: "unopened", name: "Residential lease", description: "1 Picadilly lease starting 2021/1/1")
puts "Is this a valid contract? #{contract1.valid?}"
contract1.save!
puts "Creating contract 1 (for company 1): done"
puts " "

# 8. Company 1 creates contract 2 for individual 2
puts "Creating contract 2 (for company 1) for individual 2 [signed]..."
contract2 = Contract.new(company_id: company1.id, individual_id: individual2.id, email: individual2.user.email,fully_signed_at: nil, status: "unopened", name: "Commercial lease", description: "2 Picadilly lease starting 2021/1/2")
puts "Is this a valid contract? #{contract2.valid?}"
puts "Signing..."
contract2.fully_signed_at = Time.now
contract2.save!
puts "Creating contract 2 (for company 1) for individual 2: done"
puts " "

# 9. Company 1 creates contract 3 for individual 3
puts "Creating contract 3 (for company 1) for individual 3..."
contract3 = Contract.new(company_id: company1.id, individual_id: individual3.id, email: individual3.user.email, fully_signed_at: nil, status: "unopened", name: "Commercial lease", description: "3 Picadilly lease starting 2021/1/3")
puts "Is this a valid contract? #{contract3.valid?}"
contract3.save!
puts "Creating contract 3 (for company 1): done"
puts " "

# 10. Company 1 creates contract 4 for individual 4
puts "Creating contract 4 (for company 1) for individual 4 [signed]..."
contract4 = Contract.new(company_id: company1.id, individual_id: individual4.id, email: individual4.user.email, fully_signed_at: nil, status: "unopened", name: "Residential lease", description: "4 Picadilly lease starting 2021/1/4")
puts "Is this a valid contract? #{contract4.valid?}"
puts "Signing..."
contract4.fully_signed_at = Time.now
contract4.save!
puts "Creating contract 4 (for company 1) for individual 4: done"
puts " "

# 11. Company 2 creates contract 5 for individual 1
puts "Creating contract 5 (for company 2) for individual 1..."
contract5 = Contract.new(company_id: company2.id, individual_id: individual1.id, email: individual1.user.email, fully_signed_at: nil, status: "unopened", name: "Residential lease", description: "5 Picadilly lease starting 2021/1/5")
puts "Is this a valid contract? #{contract5.valid?}"
contract5.save!
puts "Creating contract 5 (for company 2): done"
puts " "

# 12. Company 2 creates contract 6 for individual 2
puts "Creating contract 6 (for company 2) for individual 2 [signed]..."
contract6 = Contract.new(company_id: company2.id, individual_id: individual2.id, email: individual2.user.email, fully_signed_at: nil, status: "unopened", name: "Commercial lease", description: "6 Picadilly lease starting 2021/1/6")
puts "Is this a valid contract? #{contract6.valid?}"
contract6.save!
puts "Creating contract 6 (for company 2) for individual 2: done"
puts " "

# 13. Company 2 creates contract 7 for individual 3
puts "Creating contract 7 (for company 2) for individual 3..."
contract7 = Contract.new(company_id: company2.id, individual_id: individual3.id, email: individual3.user.email, fully_signed_at: nil, status: "unopened", name: "Commercial lease", description: "7 Picadilly lease starting 2021/1/7")
puts "Is this a valid contract? #{contract7.valid?}"
contract7.save!
puts "Creating contract 7 (for company 2): done"
puts " "

# 14. Company 2 creates contract 8 for individual 4
puts "Creating contract 8 (for company 2) for individual 4 [signed]..."
contract8 = Contract.new(company_id: company2.id, individual_id: individual4.id, email: individual4.user.email, fully_signed_at: nil, status: "unopened", name: "Residential lease", description: "8 Picadilly lease starting 2021/1/8")
puts "Is this a valid contract? #{contract8.valid?}"
puts "Signing..."
contract8.fully_signed_at = Time.now
contract8.save!
puts "Creating contract 8 (for company 2) for individual 4: done"
puts " "

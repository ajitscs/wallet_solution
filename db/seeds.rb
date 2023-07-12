# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(first_name: "Raj", last_name: "Kumar", type: "Team", wallet_balance: 453.23)
user2 = User.create(first_name: "Rishi", last_name: "Kumar", type: "Stock", wallet_balance: 653.43)
user3 = User.create(first_name: "Shid", last_name: "Bhati", type: "Team", wallet_balance: 653.43)

# wallet = Wallet.create(balance: 500, currency: 'INR', user_id: user1.id)
# wallet = Wallet.create(balance: 600, currency: 'INR', user_id: user2.id)
# wallet = Wallet.create(balance: 700, currency: 'INR', user_id: user3.id)

# Transaction.create(amount: 112.5, source_wallet_id: user1.wallet.id, target_wallet_id: user3.wallet.id)
# Transaction.create(amount: 143.5, source_wallet_id: user2.wallet.id, target_wallet_id: user1.wallet.id)
# Transaction.create(amount: 250.5, source_wallet_id: user2.wallet.id, target_wallet_id: user3.wallet.id)

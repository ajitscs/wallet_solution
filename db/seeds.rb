# create default user 
user = Account.create(first_name: "Admin", last_name: "Test", type: "User", email: "ajit@yopmail.com", password: "ajit1234", username: "ajit1")

# add some money(500) in the Admin user's wallet so that he can initiate the transaction flow
Wallet.create(account_id: user.id, balance: 500, currency: 'INR')

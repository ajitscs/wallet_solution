# README

* Database used is sqlite3

* Ruby version used is 2.7.5

* Rails version used is 7.0.4

* Running the app
- bundle install
- rails db:create
- rails db:migrate
- rails db:seed

* APIs

- POST http://localhost:3000/api/auth/login
- Prameters: Email, password
- Description: This API will take email and password as input, validate the password and return the token, this token consists the user ID in encrypted format and will be used for authentication of API calls.


- GET http://localhost:3000/api/check_balance
- Authentication method: Bearer Auth Example: Authorization token_of_user
- Description: This API returns the calculated balance of the user validated by the token.


- POST http://localhost:3000/api/transactions
- Prameter: transaction hash consist of amount and target_wallet_id
- Desctription: This API will create transaction entry, the source wallet will be user's wallet who is logged in(authenticated by the token). Target wallet is the wallet in which the amount should be credited. Validation of available balance is present in the API to validate the amount transfer.

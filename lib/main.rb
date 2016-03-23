require_relative "person.rb"
require_relative "store.rb"

store = Store.new(store_name: "Jake's Computer Shop")

art = Person.new(name: "Art Burtch", birthday: "8/22/1991", pronoun_gender: "male", address: "922 S 11th St")
store.add_customer_profile(art)

store.greet_customer

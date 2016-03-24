# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "admin1", password: "password", name: "peter", age: 16, gender: "male")
User.create(username: "admin2", password: "password", name: "charlie", age: 17, gender: "male")
User.create(username: "patient1", password: "password", name: "joe", age: 18, gender: "male")
User.create(username: "patient2", password: "password", name: "jon", age: 19, gender: "male")

ActiveIngredient.create(name: "dextromethorphan")
ActiveIngredient.create(name: "pseudoephedrine")
ActiveIngredient.create(name: "acetaminophen")
ActiveIngredient.create(name: "tetrahydrocannabinol")

Medicine.create(name: "cough syrup", active_ingredient_id:1, dose: 3)
Medicine.create(name: "sudafed", active_ingredient_id:2, dose: 1)
Medicine.create(name: "pain killer", active_ingredient_id:3, dose: 2)
Medicine.create(name: "marijuana", active_ingredient_id:4, dose: 5)

Prescription.create(patient_id:3, medicine_id:1)
Prescription.create(patient_id:3, medicine_id:2)
Prescription.create(patient_id:4, medicine_id:3)
Prescription.create(patient_id:4, medicine_id:4)


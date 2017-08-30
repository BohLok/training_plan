# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email ='bohlok@gmx.de'
user.password = '123456'
user.password_confirmation = '123456'
user.save!

user = User.new
user.email ='admin@admin.de'
user.password = 'admin123'
user.password_confirmation = 'admin123'
user.admin = true
user.save!


10.times do |t|  
  Training.create!([{user_id: '1', 
                    t_date: "#{t+1}.5.2017", 
                    title: "Training #{t}", 
                    body: 'Dauerlauf locker', 
                    length: '10', 
                    difficulty: '3'}])
end

10.times do |t|  
  Training.create!([{user_id: '2', 
                    t_date: "#{t+1}.6.2017", 
                    title: "Admin - Training #{t}", 
                    body: 'Admin-Dauerlauf locker', 
                    length: '10', 
                    difficulty: '3'}])
end

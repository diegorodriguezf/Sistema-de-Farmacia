# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user seeder create
@user=User.first()
if @user.blank?
	user = User.new(
        first_name: 'Diego Ramón',
	    last_name: 'Rodriguez Figueredo',
		username: 'Diego' ,
	    password: 'riper_010989'
        )
      user.save!
end
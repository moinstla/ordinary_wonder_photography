user_list = [
  ["admin@admin.com", "123456", true,],

]

user_list.each do |email,  password, admin|
  User.create(email: email, password: password, admin: admin)
end

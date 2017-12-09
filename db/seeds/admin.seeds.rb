#管理者
Admin.find_or_create_by(id: 1) do |user|
    user.email = 'admin@admin'
    user.password = 'password'
  end

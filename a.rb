require 'bcrypt'
signup_password = BCrypt::Password.create("sanriko") #登録
puts signup_password

login_password = BCrypt::Password.new(signup_password)
if login_password == "sanriko" # params[:pass] 平文
    p"ログイン成功"
end
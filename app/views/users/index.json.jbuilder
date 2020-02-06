json.array! @users do |user|
  json.id user.id
  json.name user.name
end
# 2/5 インクリメンタルサーチで追記
# ディレクト場所が間違っていた メンターさんより
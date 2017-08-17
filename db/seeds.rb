# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

name = Array["miyagawa", "yamada", "takeda", "yamashita", "oyama", "takimoto", "fujimori", "akiyama"]

follow = Array[[1,3],[1,2],[1,8],[2,3],[2,5],[2,4],[4,5],[1,5]]

for i in (1..name.length) do
    @user = User.new
    @user.username = "hoge" + i.to_s
    @user.password = i.to_s+i.to_s+i.to_s+i.to_s
    @user.name = name[i-1]
    @user.about = "Test User No." + i.to_s
    @user.save
end

follow.each do |f|
    @follow = Follow.new
    @follow.uid = f[0]
    @follow.fid = f[1]
    @follow.save
end
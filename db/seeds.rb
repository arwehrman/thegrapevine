User.destroy_all
 User.create!([{
   username: "test1",
   email: "test1@email.com",
   password: "password1"
 },
 {
   username: "test2",
   email: "test2@email.com",
   password: "password2"
 },
 {
   username: "test3",
   email: "test1@email.com",
   password: "password3"
 }])

Wine.destroy_all
 Wine.create!([{
   maker: "Wine 1",
   wine_type: "Pinot",
   region: "Australia",
   vintage: 2017,
   price: 25.00,
   rating: 2,
   user_id: 1
 },
 { maker: "Wine 2",
   wine_type: "Chardonay",
   region: "Reims",
   vintage: 2014,
   price: 35.00,
   rating: 3,
   user_id: 2
 },
 {
   maker: "Wine 3",
   wine_type: "Shiraz",
   region: "Australia",
   vintage: 2013,
   price: 23.00,
   rating: 4,
   user_id: 3
 }])

Comment.destroy_all
Comment.create!([{
  content: "testing comment 1",
  user_id: 1,
  wine_id: 1
},
{
  content: "testing comment 2",
  user_id: 2,
  wine_id: 2
},
{ content: "testing comment 3",
  user_id: 1,
  wine_id: 1
},
{
  content: "testing comment 4",
  user_id: 3,
  wine_id: 3
}

  ])

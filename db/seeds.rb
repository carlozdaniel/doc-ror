Photo.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE PHOTOS_id_seq RESTART WITH 1")

AdminUser.create!(email: "admin@example.com", password: "123456789")
User.create!(name: carlos, email: "admin@example.com", password: "123456789")

Photo.create!(
  name: 'supra',
  url: 'http://3.bp.blogspot.com/-7tYGJQiKDd4/UD1SFKW3MFI/AAAAAAAAAdE/pcwoZ73V2TE/s1600/TOYOTA-SUPRA-TUNING-sports-cars-31586023-1024-709.jpg',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1 )
Photo.create!(
  name: 'brz',
  url: 'https://wallup.net/wp-content/uploads/2019/09/07/496994-toyota-gt86-scion-frs-subaru-brz-coupe-tuning-cars-japan-748x421.jpg',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)

Photo.create!(
  name: '350z black',
  url: 'https://clubjapostorage.s3.dualstack.eu-west-1.amazonaws.com/optimized/3X/d/b/db941294e0f394daa7c66874d440aa3aa151f13b_2_1024x635.jpeg',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)
Photo.create!(
  name: '350z red',
  url: 'http://cdn.shopify.com/s/files/1/1668/8171/products/17020350_RF1_grande.jpg?v=1500081293',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)
Photo.create!(
  name: '350z yellow',
  url: 'https://besthqwallpapers.com/Uploads/16-3-2018/44431/thumb2-rocket-bunny-tuning-nissan-350z-4k-supercars.jpg',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)
Photo.create!(
  name: '240z blue',
  url: 'https://i.pinimg.com/originals/79/53/a2/7953a2a170aa54dd79f96ad93d98036c.jpg',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)
Photo.create!(
  name: '240z red',
  url: 'https://www.pruebaderuta.com/wp-content/uploads/2015/10/datsun-240z-tuneado.jpg',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)
Photo.create!(
  name: '300zx gray',
  url: 'https://lh3.googleusercontent.com/proxy/YcuNPq0aws26zCLIf31RzcJyrOCtTK_f67g6NmIWlt_9tmkF_rPC-E8gLT-rgqV-637WUjKJ69BtQBqGjI3wRuFbEkbzsUQ0xNdrn3h1sFTFH20VEmN2AP2UZVGb',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)
Photo.create!(
  name: '300zx Golden',
  url: 'https://cs2.gtaall.net/screenshots/d9802/2020-05/original/af3790a8d64f3a6c5ff224941cb7b4a062bd2c02/804482-GTAIV-2020-05-29-13-45-54-50.jpg',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)
Photo.create!(
  name: 'eclipse',
  url: 'https://lh3.googleusercontent.com/proxy/y67Hn0ihWEL1nMZ6d29LEn5Dyv5-pfJcztUN9mC6TFWw-EjXb-QBaavUFjet2CJynVI7EuG7Z4wFh5U6-xhWhs3cKc6knURTK-f6IBhjc7nT_3xI9ZW49JYo-Aw44w',
  description: 'loren',
  license: 'copyleft',
  visibility: pub,
  user_id: 1)
  
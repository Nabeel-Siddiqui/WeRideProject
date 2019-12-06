# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Driver.destroy_all
Rider.destroy_all
Ride.destroy_all

d1 = Driver.create(name: "Driver One", car: "Car One", rating: 5, image: "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg", car_image: "https://www.pexels.com/photo/blue-bmw-sedan-near-green-lawn-grass-170811/")

d2 = Driver.create(name: "Driver Two", car: "Car Two", rating: 3, image: "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg", car_image: "https://www.pexels.com/photo/car-vehicle-automobile-range-rover-116675/")

d3 = Driver.create(name: "Driver Three", car: "Car Three", rating: 4, image: "http://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg", car_image: "https://www.pexels.com/photo/green-scale-model-car-on-brown-pavement-35967/")


r1 = Rider.create(name: "Rider One", rating: 3, image: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg")
r2 = Rider.create(name: "Rider Two", rating: 5, image: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg")
r3 = Rider.create(name: "Rider Three", rating: 1, image: "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg")

rd1 = Ride.create(driver: d1, rider: r2, start: 2.00, end: 1.00, cost: 5.43)
rd2 = Ride.create(driver: d3, rider: r1, start: 3.32, end: 1.33, cost: 1.22)
rd3 = Ride.create(driver: d2, rider: r3, start: 3.11, end: 1.03, cost: 2.11)


Horse.destroy_all
Breed.destroy_all
AdminUser.destroy_all

NUMBER_OF_BREEDS = 4
HORSES_PER_BREED = 4

NUMBER_OF_BREEDS.times do
  breed = Breed.create(name: Faker::Creature::Horse.unique.breed)

  HORSES_PER_BREED.times do
    horse = breed.horses.create(
      name: Faker::Creature::Horse.unique.name,
      age: rand(3..348),
      top_speed: 3.1415926 * rand(20..56),
      number_of_legs: rand(1..14)
    )
    # ADD THESE 4 LINES OF CODE:
    query = URI.encode_www_form_component([horse.name, breed.name].join(','))
    downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
    horse.image.attach(io: downloaded_image, filename: "m-#{[horse.name, breed.name].join('-')}.jpg")
    sleep(1) # <=== if youre downloading A LOT of images,
    # do yourself a favour and DONT get yourself blocked by spamming the API.
  end
end

puts "Created #{Breed.count} Breeds."
puts "Created #{Horse.count} Horses."
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

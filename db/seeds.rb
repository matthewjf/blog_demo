User.create!(name:  "Admin User",
             email: "admin@rig.org",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now )

StaticPage.create!(name: "About", content: "blank")
StaticPage.create!(name: "Contact", content: "blank")


User.create!(name:  "Non-admin User",
            email: "example@example.com",
            password:              "password",
            password_confirmation: "password",
            admin: false,
            activated: true,
            activated_at: Faker::Date.backward(1000) )
30.times do |n|
  User.create!(name: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: User.digest('password'),
    activated: true,
    activated_at: Faker::Date.backward(1000),
    admin: false)
end

def create_section(post)
  content = Faker::Lorem.paragraph(6, true, 6)
  title = Faker::Lorem.sentence(3,true, 3)[0...-1]
  image_url = 'https://unsplash.it/1200/768/?random'
  post.sections.create!(
    title: title,
    body: content,
    remote_picture_url: image_url
  )
end

def create_seed_post(published_at = Faker::Date.backward(1000))
  content = Faker::Lorem.paragraph(6, true, 6)
  title = Faker::Lorem.sentence(3,true, 3)[0...-1]
  image_url = 'https://unsplash.it/1200/768/?random'
  post = User.find(1).posts.create!(
    body: content,
    title: title,
    published_at: published_at,
    remote_picture_url: image_url
  )

  (rand(3) + 1).times { create_section(post) };
end

15.times { create_seed_post }
5.times { create_seed_post(nil) }

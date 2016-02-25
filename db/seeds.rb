User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now )

User.create!(name:  "Non-admin User",
            email: "example@example.com",
            password:              "password",
            password_confirmation: "password",
            admin: false,
            activated: true,
            activated_at: Time.zone.now )

10.times do
  content = Faker::Lorem.sentence(50)
  title = Faker::Lorem.sentence(3)
  section_title = Faker::Lorem.sentence(1)
  section_content = Faker::Lorem.sentence(25)
  @post = User.find(1).posts.create!(body: content, title: title)
  @post.sections.create!(title: section_title, body: section_content)
end

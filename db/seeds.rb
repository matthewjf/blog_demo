User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now )

unless Rails.env.production?
  User.create!(name:  "Non-admin User",
              email: "example@example.com",
              password:              "password",
              password_confirmation: "password",
              admin: false,
              activated: true,
              activated_at: Time.zone.now )


  def create_seed_post(published = true)
    content = Faker::Lorem.paragraph
    title = Faker::Lorem.words.join(' ')
    section_title = Faker::Lorem.words.join(' ')
    section_content = Faker::Lorem.paragraph
    post = User.find(1).posts.create!(body: content, title: title)
    post.sections.create!(title: section_title, body: section_content)
    post.published = true
  end

  11.times { create_seed_post }
  1.times { create_seed_post(false) }
end

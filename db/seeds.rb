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

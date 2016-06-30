Party.create(title: "night walkers", password_hash: "night")

User.create(name: "mike", email: "mike@mike.com", password_hash: "mike")

UserParty.create(user_id: 1, party_id: 1)

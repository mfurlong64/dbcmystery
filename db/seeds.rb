Party.create(title: "The 13th Floor", password_hash: "123")
Party.create(title: "Type M for Murder", password_hash: "123")


User.create(name: "mike", email: "mike@mike.com", password_hash: "mike")
User.create(name: "sam", email: "sam@sam.com", password_hash: "sam")
User.create(name: "cat", email: "cat@cat.com", password_hash: "cat")

UserParty.create(user_id: 1, party_id: 1)
UserParty.create(user_id: 2, party_id: 1)
UserParty.create(user_id: 3, party_id: 1)

UserParty.create(user_id: 1, party_id: 2)
UserParty.create(user_id: 2, party_id: 2)


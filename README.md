Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


## when signing up with email and password
make sure to create name,username

we shouldnt have named this columns this way

```rb
    t.string "github_avatar_url"
    t.string "github_username"
    t.string "github_name"
    t.string "github_uid"
    t.string "provider"
    t.string "github_location"
```

```rb
    t.string "avatar_url" # when not github create default image
    t.string "username" # get username from email before @ (alice@email -> alice)
    t.string "name" # get username from email before @ (alice@email -> alice)
    t.string "uid" #when not github generate random uid
    t.string "provider" # when not github  put 'basic'
    t.string "location" # put blank string ''
```

## We are here to find a job
Depth - the more you know about one topic
- search
- chat
- payment
- notification
- map
- apis to check stuff
- omniauth
Breadth - the more you know about several topics
basic crud - for clothes
basic crud - for ships
basic crud - for animals
basic crud - for hospital

## We are here to solve problems we are familiar with
Prefer problems you have familiarity
Start with small markets who you can talk to and have feedback
Later we can expand

Appointments
start_time
end_time
issue_id
tutor_id
pupil_id

Issues
add column Available_on default value day, hour


## TODO
- [ ] As a user I can create an issue - limit to issues#new
  - [x] add column for available_on
  - [ ] improve style of /issues/new
    - [ ] add placeholder for issue description
    - [ ] add placeholder for issue available_on

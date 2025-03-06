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



### Post API App
This app can do following things :-

 1. Sign Up User
 2. Login User
 3. Create Post
 4. Comment on Post
 5. LIKE post and Comment
 6. Index Post
 7. Show Post with comments and likes count
 8. Get report for post comments count and likes count
 9. Get report for user with number of posts

# Setup Project
## Requirements

 1. Ruby 2.7.3p183
 2. Rails 6.1.4.1
 3. Mysql - Server version: 8.0.27-0ubuntu0.20.04.1

## Run Project
 1. git clone https://github.com/mihir-kumar-thakur/blog-app.git
 2. cd blog-app
 3. bundle install
 4. bundle exec rake db:create db:migrate
 5. rails s
 6. rails c



    ##  Sign Up User
    curl --location --request POST 'http://localhost:3000/api/v1/users' \

    --header 'Content-Type: application/json' \

    --header 'X-Requested-With: XMLHttpRequest' \

    --data-raw '{"user": {"email":"mihir1@gmail.com", "password":"India@123", "password_confirmation": "India@123", "first_name":"Mihir", "last_name": "Thakur"}}'

## Response

    {

    "id": 7,

    "email": "mihir1@gmail.com",

    "created_at": "2021-11-28T05:44:34.713Z",

    "updated_at": "2021-11-28T05:44:34.842Z",

    "first_name": "Mihir",

    "last_name": "Thakur"

  }

## Login

  curl --location --request POST 'http://localhost:3000/api/v1/users/sign_in' \

    --header 'Content-Type: application/json' \

    --header 'X-Requested-With: XMLHttpRequest' \

    --data-raw '{"user":{"email":"mihir@gmail.com", "password":"India@123"}}'

## Response

    {

  "token": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6NiwiZXhwIjoxNjQzMjYyNjM3fQ.qytA6DjinC-DXctRpBGF3wkP70rXrFPDa4FJ4Vf6zI4",

  "email": "mihir@gmail.com"

  }

## Create Post

    curl --location --request POST 'http://localhost:3000/api/v1/posts' \

    --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJpZCI6NiwiZXhwIjoxNjQzMTk5ODM2fQ.DgjV8vORB5rceUELNruZ5wshhmjtYd-fCFyIYNnHv-4' \

    --header 'Content-Type: application/json' \

    --data-raw '{

    "post": {"title": "This is a test post indise", "body": "Hello world", "status": "published"}

    }'

## Response

      {

    "data": {

    "id": 4,

    "title": "This is a test post indise",

    "body": "Hello world",

    "status": "published",

    "user_id": 6,

    "created_at": "2021-11-28T05:51:50.335Z",

    "updated_at": "2021-11-28T05:51:50.335Z"

    },

    "message": "Post created"

  }

## Comment on Post

   curl --location --request POST 'http://localhost:3000/api/v1/posts/2/comments' \

    --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJpZCI6NiwiZXhwIjoxNjQzMTk5ODM2fQ.DgjV8vORB5rceUELNruZ5wshhmjtYd-fCFyIYNnHv-4' \

    --header 'Content-Type: application/json' \

    --data-raw '{

    "comment": {"body": "This is a test comment"}

    }'

## Response

    {

    "data": {

    "id": 11,

    "body": "This is a test comment",

    "user_id": 6,

    "post_id": 2,

    "created_at": "2021-11-28T05:53:51.037Z",

    "updated_at": "2021-11-28T05:53:51.037Z"

    },

    "message": "Comment created"

  }

## Like Post
  curl --location --request POST 'http://localhost:3000/api/v1/posts/2/like' \

    --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJpZCI6NiwiZXhwIjoxNjQzMTk5ODM2fQ.DgjV8vORB5rceUELNruZ5wshhmjtYd-fCFyIYNnHv-4'

## Response

    {

    "data": {

    "id": 1,

    "likeable_id": 2,

    "likeable_type": "Post",

    "user_id": 6,

    "created_at": "2021-11-27T14:30:38.519Z",

    "updated_at": "2021-11-27T14:30:38.519Z"

    },

    "message": "Post liked"

  }

## Like on comment

    curl --location --request POST 'http://localhost:3000/api/v1/posts/2/comments/2/like' \

  --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJpZCI6NiwiZXhwIjoxNjQzMTk5ODM2fQ.DgjV8vORB5rceUELNruZ5wshhmjtYd-fCFyIYNnHv-4'

## Response

  {

    "data": {

    "id": 2,

    "likeable_id": 2,

    "likeable_type": "Comment",

    "user_id": 6,

    "created_at": "2021-11-27T14:42:57.893Z",

    "updated_at": "2021-11-27T14:42:57.893Z"

    },

    "message": "Comment liked"

  }

## Index Post

      curl --location --request GET 'http://localhost:3000/api/v1/posts' \

      --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJpZCI6NiwiZXhwIjoxNjQzMTk5ODM2fQ.DgjV8vORB5rceUELNruZ5wshhmjtYd-fCFyIYNnHv-4'


## Response

    [

    {

    "id": 1,

    "title": "This is a test post indise",

    "body": "Hello world",

    "status": "published",

    "user_id": 6,

    "created_at": "2021-11-27T12:43:58.635Z",

    "updated_at": "2021-11-27T17:23:18.123Z"

    },

    {

    "id": 2,

    "title": "This is a test post indise",

    "body": "Hello world",

    "status": "published",

    "user_id": 6,

    "created_at": "2021-11-27T12:45:03.670Z",

    "updated_at": "2021-11-27T12:45:03.670Z"

    }

  ]

## API for viewing a post with all of its comments and count of likes for the post, count of likes for each comment.

      curl --location --request GET 'http://localhost:3000/api/v1/posts/2' \

      --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJpZCI6NiwiZXhwIjoxNjQzMTk5ODM2fQ.DgjV8vORB5rceUELNruZ5wshhmjtYd-fCFyIYNnHv-4'


## Response


     {

    "post": {

    "id": 2,

    "body": "Hello world",

    "status": "published",

    "title": "This is a test post indise",

    "user_id": 6,

    "likes_count": 1

    },

    "comments": [

    {

    "id": 1,

    "body": null,

    "post_id": 2,

    "user_id": 6,

    "likes_count": 0

    },

    {

    "id": 2,

    "body": "This is a test comment",

    "post_id": 2,

    "user_id": 6,

    "likes_count": 1

    },

    {

    "id": 3,

    "body": "This is a test comment",

    "post_id": 2,

    "user_id": 6,

    "likes_count": 0

    },

    {

    "id": 10,

    "body": "This is a test comment",

    "post_id": 2,

    "user_id": 6,

    "likes_count": 0

    },

    {

    "id": 11,

    "body": "This is a test comment",

    "post_id": 2,

    "user_id": 6,

    "likes_count": 0

    }

    ]

  }

## Reports for Total number of likes and comments a user received for each of his/her post

     PostReports.call

## Response

     [{:post_id=>1, :comment_count=>6, :likes_count=>0}, {:post_id=>2, :comment_count=>5, :likes_count=>1}]

## Report List of all users(having at least one post) and count of their posts

    UserReports.call

## Response


    [{:user_id=>6, :number_of_posts=>4}]

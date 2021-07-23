# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



API DOCUMENTATION
-------------------------------------

ACTOR APIS
----------------

1) Actor Sign Up
   -------------

   API:  POST http://localhost:3000/actors

   Request: 

    {"actor": {"name": "Test", "email": "test@example.com", "password": "test123", "password_confirmation": "test123"} }

   Response:
    
    {
     "status": "Actor created successfully"
    }

2) Actor Sign In
   --------------

   API: POST  http://localhost:3000/actors/login

   Request:

     {"email": "test@example.com", "password": "test123"}

   Response:
   
    {
     "auth_token":   "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjc2MDQ2NTEsImlzcyI6Imlzc3Vlcl9uYW1lIiwiYXVkIjoiY2xpZW50IiwiYWN0b3JfaWQiOjF9.Yvrfh6slnc00RPi_Fga_wEx6O7FQN9eL6Gandz1TWgw"
    }

  
 REPO APIS
 -------------

 3)  API: POST http://localhost:3000/repos

     Request:

       {"repo": {"name": "Newtest"} }

     Response:
   
       {
        "id": 1,
        "name": "Newtest"
       }


 EVENT APIS
 -------------   

  For Event apis headers are mandatory for all requests.

  HEADER:
  -------
   
   key: Authorization

   value: Actor Sign In Token
  
   Eg:

   Key:  Authorization

   Value: "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjc2MDQ2NTEsImlzcyI6Imlzc3Vlcl9uYW1lIiwiYXVkIjoiY2xpZW50IiwiYWN0b3JfaWQiOjF9.Yvrfh6slnc00RPi_Fga_wEx6O7FQN9eL6Gandz1TWgw"
 

4)  Event Index (View All Events)
   -------------------------------

   API: GET http://localhost:3000/events 
             OR 
        GET http://localhost:3000/events?paginate=1

   Request:     

   Headers:  
   
       Key: Authorization

       Value: "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjc2MDQ2NTEsImlzcyI6Imlzc3Vlcl9uYW1lIiwiYXVkIjoiY2xpZW50IiwiYWN0b3JfaWQiOjF9.Yvrfh6slnc00RPi_Fga_wEx6O7FQN9eL6Gandz1TWgw"


   Response:

      [
       {
        "id": 1,
        "actor_id": 1,
        "repo_id": 1,
        "public": "t",
        "event_type": "PushEvent",
        "created_at": "2021-07-23T00:34:19.886Z",
        "updated_at": "2021-07-23T00:34:19.886Z"
       }
      ]


6) Create Event
   -------------

   API: POST http://localhost:3000/events

   Request:

   Headers:
   
       Key: Authorization

       Value: "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjc2MDQ2NTEsImlzcyI6Imlzc3Vlcl9uYW1lIiwiYXVkIjoiY2xpZW50IiwiYWN0b3JfaWQiOjF9.Yvrfh6slnc00RPi_Fga_wEx6O7FQN9eL6Gandz1TWgw"

   Json:

     {"event": {"event_type": "PushEvent","repo_id": 1, "public": true} }


    Response:
      
     {
       "id": 1,
       "actor_id": 1,
       "repo_id": 1,
       "public": "t",
       "event_type": "PushEvent",
       "created_at": "2021-07-23T00:34:19.886Z",
       "updated_at": "2021-07-23T00:34:19.886Z"
      }


6)  Event Show (View An Event)
   -------------------------------

   API: GET http://localhost:3000/events/1

   Request:     

   Headers:  
   
       Key: Authorization

       Value: "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjc2MDQ2NTEsImlzcyI6Imlzc3Vlcl9uYW1lIiwiYXVkIjoiY2xpZW50IiwiYWN0b3JfaWQiOjF9.Yvrfh6slnc00RPi_Fga_wEx6O7FQN9eL6Gandz1TWgw"


   Response:

      {
       "id": 1,
       "actor_id": 1,
       "repo_id": 1,
       "public": "t",
       "event_type": "PushEvent",
       "created_at": "2021-07-23T00:34:19.886Z",
       "updated_at": "2021-07-23T00:34:19.886Z"
      }



7)  View An Event Of A Particular Repo
   -----------------------------------

   API: http://localhost:3000/repos/1/events
                  OR
        http://localhost:3000/repos/1/events?paginate=1

   Request:     

   Headers:  
   
       Key: Authorization

       Value: "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjc2MDQ2NTEsImlzcyI6Imlzc3Vlcl9uYW1lIiwiYXVkIjoiY2xpZW50IiwiYWN0b3JfaWQiOjF9.Yvrfh6slnc00RPi_Fga_wEx6O7FQN9eL6Gandz1TWgw"


   Response:

      [
       {
        "id": 1,
        "actor_id": 1,
        "repo_id": 1,
        "public": "t",
        "event_type": "PushEvent",
        "created_at": "2021-07-23T00:34:19.886Z",
        "updated_at": "2021-07-23T00:34:19.886Z"
       }
      ]


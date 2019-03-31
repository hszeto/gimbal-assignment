# README
* Rails version 5.2.2
* Ruby version 2.5.1
* Run test:
  1. bundle install
  2. rake db:create
  3. rake db:migrate
  3. rake db:seed
  2. rake db:migrate RAILS_ENV=test 
  3. bundle exec rspec spec

### Usage with curl
```
curl -X POST \
  https://gimbal-assignment.herokuapp.com/api/nearby \
  -H 'Content-Type: application/json' \
  -d '{
    "lat": "34.0342747",
    "lon": "-118.241705"
  }'
```
##### Success response body:
```
{"cafes": [{...}], "radius": 1.2345}
```
##### Success response code: 
* 200
##### Fail response body:
```
{"error": "Invalid params"}
```
##### Fail response error code: 
* 422
* reason: missing params or invalid params

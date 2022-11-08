# Server API Overview
> Request are always made by the client

## Get image post data
Request:
```json
{
  "type": "get",
  "target": "imagepost",
  "contentID": "<ID>"    //the posts ID
}
```
Response:
```json
{
  "type": "delivery",
  "target": "imagepost",
  "contentID": "abcdef123456",
  "publisherID": "johnsmith2000",
  "imageURL": "https://example.com/avatar.jpg",
  "postDescription": "Lorem ipsum.",
  "likeCount": 100,
  "locationNorth": "51.0544896",
  "locationEast": "13.7330875",
  "commentchainID": "<ID>" //to look up the comments if needed
}
```
<br>

## Get user quick info
Request:
```json
{
  "type": "get",
  "target": "userinfo",
  "contentID": "johnsmith2000"  //the username
}
```
Response:
```json
{
  "type": "delivery",
  "target": "userinfo",
  "contentID": "johnsmith2000",
  "publicName": "John Smith",
  "avatarURL": "https://example.com/avatar.jpg",
  "isFollowed": true,   //Are we following?
  "isFollowing": false  //Is he following us?
}
```
<br>

## Get user profile data
Request:
```json
{
  "type": "get",
  "target": "userprofile",
  "contentID": "johnsmith2000"  //the username
}
```
Response:
```json
{
  "type": "delivery",
  "target": "userprofile",
  "contentID": "johnsmith2000",
  "publicName": "John Smith",
  "avatarURL": "https://example.com/avatar.jpg",
  "postCount": 5,
  "followerCount": 90,
  "followingCount": 50,
  "bio": "Lorem Ipsum.",
  "isFollowed": true,   //Are we following?
  "isFollowing": false  //Is he following us?
}
```
<br>

## Get comment chain
> This feature has no UI endpoint yet.
Request:
```json
{
  "type": "get",
  "target": "commentchain",
  "contentID": "<ID>" 
}
```
Response:
```json
{
  "type": "delivery",
  "target": "commentchain",
  "contentID": "<ID>",
  "commentsCount": 5,
  "payload": [
        { "commentID": "<ID>" },    //for getting the comments
        { "commentID": "<ID>" },
        { ... }
    ]
}
```
<br>

## Get single comment
> This feature has no UI endpoint yet.
Request:
```json
{
  "type": "get",
  "target": "comment",
  "contentID": "<ID>" 
}
```
Response:
```json
{
  "type": "delivery",
  "target": "comment",
  "contentID": "<ID>",
  "authorID": "<ID>",
  "payload": "<ID>"
}
```
<br>

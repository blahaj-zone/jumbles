# API Documentation

## Authentication Endpoints

### Register
- **POST** `/api/register`
- Creates a new user account
- **Request Body**:
  ```json
  {
    "username": "string",
    "email": "string",
    "password": "string"
  }
  ```
- **Response**:
  ```json
  {
    "token": "string",
    "user": {
      "id": "string",
      "username": "string",
      "email": "string",
      "createdAt": "timestamp",
      "updatedAt": "timestamp"
    }
  }
  ```

### Login
- **POST** `/api/login`
- Authenticates a user and returns a JWT token
- **Request Body**:
  ```json
  {
    "username": "string",
    "password": "string"
  }
  ```
- **Response**:
  ```json
  {
    "token": "string",
    "user": {
      "id": "string",
      "username": "string",
      "email": "string",
      "createdAt": "timestamp",
      "updatedAt": "timestamp"
    }
  }
  ```

## Group Management Endpoints
All group management endpoints require authentication via Bearer token.

### List Groups
- **GET** `/api/groups`
- Returns a list of all groups
- **Response**: Array of group objects

### Create Group
- **POST** `/api/groups`
- Creates a new group
- **Request Body**:
  ```json
  {
    "name": "string",
    "description": "string",
    "private": boolean
  }
  ```
- **Response**: Group object

### Get Group
- **GET** `/api/groups/{groupID}`
- Returns details of a specific group
- **Response**: Group object

### Update Group
- **PUT** `/api/groups/{groupID}`
- Updates group details (requires admin permission)
- **Request Body**:
  ```json
  {
    "description": "string",
    "private": boolean
  }
  ```
- **Response**: Updated group object

## Group Membership Endpoints

### List Members
- **GET** `/api/groups/{groupID}/members`
- Returns list of group members
- **Response**: Array of member objects

### Update Member
- **PUT** `/api/groups/{groupID}/members/{userID}`
- Updates member permissions (requires admin permission)
- **Request Body**:
  ```json
  {
    "permission": "string" // Permission level
  }
  ```

### Request Join
- **POST** `/api/groups/{groupID}/join`
- Requests to join a group
- **Response**: Join request object

### Submit Join Application
- **POST** `/api/apply/{requestID}`
- Submits application response for join request
- **Request Body**:
  ```json
  {
    "response": "string"
  }
  ```

### List Join Requests
- **GET** `/api/groups/{groupID}/requests`
- Lists pending join requests (requires approver permission)
- **Response**: Array of join request objects

### Approve Join Request
- **POST** `/api/groups/{groupID}/requests/{requestID}/approve`
- Approves a join request (requires approver permission)

### Decline Join Request
- **POST** `/api/groups/{groupID}/requests/{requestID}/decline`
- Declines a join request (requires approver permission)

## Group Moderation Endpoints

### Ban Follower
- **POST** `/api/groups/{groupID}/followers/{userID}/ban`
- Bans a follower from the group (requires moderator permission)
- **Request Body**:
  ```json
  {
    "reason": "string",
    "remove_content": boolean
  }
  ```

### Unban Follower
- **POST** `/api/groups/{groupID}/followers/{userID}/unban`
- Removes a ban (requires moderator permission)

### List Bans
- **GET** `/api/groups/{groupID}/bans`
- Lists all active bans (requires moderator permission)
- **Response**: Array of ban objects

### Deactivate Group
- **POST** `/api/groups/{groupID}/deactivate`
- Temporarily deactivates a group (requires owner permission)

### Reactivate Group
- **POST** `/api/groups/{groupID}/reactivate`
- Reactivates a deactivated group (requires owner permission)

### Suspend Group
- **POST** `/api/groups/{groupID}/suspend`
- Suspends a group (requires admin permission)

### Unsuspend Group
- **POST** `/api/groups/{groupID}/unsuspend`
- Removes group suspension (requires admin permission)

## Permission Levels
- **Owner**: Full control over group
- **Admin**: Can manage group settings and members
- **Moderator**: Can moderate content and members
- **Approver**: Can approve/decline join requests
- **Member**: Basic group access

## Authentication
All protected endpoints require a JWT token in the Authorization header:
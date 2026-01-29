# Authentication API Documentation

## Overview

This document describes the authentication endpoints for the CCY EMR Service, including login, logout, and user information retrieval.

## 1. User Login

### 1.1 API Endpoint Summary

- **Endpoint**: `POST /api/auth/login`
- **Description**: Authenticates a user and returns a JWT token
- **Authentication**: Not Required
- **Authorization**: None
- **Rate Limit**: 10 requests per minute per IP

### 1.2 Request

#### HTTP Method and URL
```
POST /api/auth/login
```

#### Headers
| Header | Required | Description | Example |
|--------|----------|-------------|---------|
| `Content-Type` | Yes | Request content type | `application/json` |

#### Request Body
```json
{
  "username": "admin",
  "password": "123456"
}
```

**Request Body Schema:**
| Field | Type | Required | Description | Validation |
|-------|------|----------|-------------|------------|
| `username` | string | Yes | User login name | Min length: 3, Max length: 50 |
| `password` | string | Yes | User password | Min length: 6, Max length: 100 |

### 1.3 Response

#### Success Response (200 OK)
```json
{
  "code": 200,
  "message": "Login successful",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "userInfo": {
      "id": 1,
      "username": "admin",
      "name": "Administrator",
      "avatar": null,
      "roles": ["ADMIN"],
      "permissions": ["system:user:list", "system:user:add", "system:role:list"]
    }
  }
}
```

#### Error Responses
| Status Code | Response Body | Description |
|-------------|---------------|-------------|
| `400 Bad Request` | `{"code": 400, "message": "Username and password are required"}` | Missing required fields |
| `401 Unauthorized` | `{"code": 401, "message": "Invalid username or password"}` | Invalid credentials |
| `403 Forbidden` | `{"code": 403, "message": "Account is disabled"}` | User account is inactive |

### 1.4 Examples

#### cURL Example
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "123456"
  }' \
  http://localhost:8080/api/auth/login
```

#### JavaScript (fetch) Example
```javascript
const loginResponse = await fetch('http://localhost:8080/api/auth/login', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    username: 'admin',
    password: '123456'
  })
});
const loginResult = await loginResponse.json();
const token = loginResult.data.token;
```

### 1.5 Notes and Considerations

- The JWT token is valid for 2 hours by default
- Failed login attempts are logged for security monitoring
- Account lockout is not implemented in the current version

## 2. User Logout

### 2.1 API Endpoint Summary

- **Endpoint**: `POST /api/auth/logout`
- **Description**: Invalidates the current user's JWT token
- **Authentication**: Required (JWT Token)
- **Authorization**: None (any authenticated user)
- **Rate Limit**: No limit

### 2.2 Request

#### HTTP Method and URL
```
POST /api/auth/logout
```

#### Headers
| Header | Required | Description | Example |
|--------|----------|-------------|---------|
| `Content-Type` | Yes | Request content type | `application/json` |
| `Authorization` | Yes | JWT Bearer token | `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` |

### 2.3 Response

#### Success Response (200 OK)
```json
{
  "code": 200,
  "message": "Logout successful",
  "data": null
}
```

#### Error Responses
| Status Code | Response Body | Description |
|-------------|---------------|-------------|
| `401 Unauthorized` | `{"code": 401, "message": "Unauthorized"}` | Invalid or missing token |

### 2.4 Examples

#### cURL Example
```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your-token>" \
  http://localhost:8080/api/auth/logout
```

## 3. Get Current User Info

### 3.1 API Endpoint Summary

- **Endpoint**: `GET /api/auth/info`
- **Description**: Returns information about the currently authenticated user
- **Authentication**: Required (JWT Token)
- **Authorization**: None (any authenticated user)
- **Rate Limit**: No limit

### 3.2 Request

#### HTTP Method and URL
```
GET /api/auth/info
```

#### Headers
| Header | Required | Description | Example |
|--------|----------|-------------|---------|
| `Authorization` | Yes | JWT Bearer token | `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` |

### 3.3 Response

#### Success Response (200 OK)
```json
{
  "code": 200,
  "message": "Success",
  "data": {
    "id": 1,
    "username": "admin",
    "name": "Administrator",
    "avatar": null,
    "roles": ["ADMIN"],
    "permissions": ["system:user:list", "system:user:add", "system:role:list", "system:menu:list"]
  }
}
```

#### Error Responses
| Status Code | Response Body | Description |
|-------------|---------------|-------------|
| `401 Unauthorized` | `{"code": 401, "message": "Unauthorized"}` | Invalid or missing token |

### 3.4 Examples

#### cURL Example
```bash
curl -X GET \
  -H "Authorization: Bearer <your-token>" \
  http://localhost:8080/api/auth/info
```

## Security Considerations

- All authentication endpoints should be accessed over HTTPS in production
- JWT tokens should be stored securely on the client side
- Implement proper token expiration and refresh mechanisms
- Monitor and log authentication attempts for security auditing

---
# API Documentation Template

## Overview

This template provides a standardized format for documenting API endpoints in the CCY EMR Service project. All new API documentation should follow this structure.

## Template Structure

### 1. API Endpoint Summary

- **Endpoint**: `HTTP_METHOD /api/path/to/endpoint`
- **Description**: Brief description of what this endpoint does
- **Authentication**: Required (JWT Token) / Not Required
- **Authorization**: Required permissions (e.g., `system:user:list`)
- **Rate Limit**: Requests per minute (if applicable)

### 2. Request

#### HTTP Method and URL
```
HTTP_METHOD /api/path/to/endpoint
```

#### Headers
| Header | Required | Description | Example |
|--------|----------|-------------|---------|
| `Content-Type` | Yes | Request content type | `application/json` |
| `Authorization` | Conditional | JWT Bearer token | `Bearer <token>` |

#### Path Parameters
| Parameter | Type | Required | Description | Example |
|-----------|------|----------|-------------|---------|
| `id` | integer | Yes | Resource ID | `123` |

#### Query Parameters
| Parameter | Type | Required | Description | Example |
|-----------|------|----------|-------------|---------|
| `page` | integer | No | Page number for pagination | `1` |
| `size` | integer | No | Page size | `10` |

#### Request Body (for POST/PUT/PATCH)
```json
{
  "field1": "value1",
  "field2": "value2",
  "nestedObject": {
    "nestedField": "nestedValue"
  }
}
```

**Request Body Schema:**
| Field | Type | Required | Description | Validation |
|-------|------|----------|-------------|------------|
| `field1` | string | Yes | Description of field1 | Max length: 50 |
| `field2` | integer | No | Description of field2 | Min: 0, Max: 100 |

### 3. Response

#### Success Response (200 OK)
```json
{
  "code": 200,
  "message": "Success",
  "data": {
    "id": 123,
    "field1": "value1",
    "field2": 42
  }
}
```

#### Error Responses
| Status Code | Response Body | Description |
|-------------|---------------|-------------|
| `400 Bad Request` | `{"code": 400, "message": "Invalid request parameters"}` | Invalid input data |
| `401 Unauthorized` | `{"code": 401, "message": "Unauthorized"}` | Missing or invalid token |
| `403 Forbidden` | `{"code": 403, "message": "Access denied"}` | Insufficient permissions |
| `404 Not Found` | `{"code": 404, "message": "Resource not found"}` | Resource doesn't exist |
| `500 Internal Server Error` | `{"code": 500, "message": "Internal server error"}` | Server error |

### 4. Examples

#### cURL Example
```bash
curl -X HTTP_METHOD \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your-token>" \
  -d '{
    "field1": "example",
    "field2": 123
  }' \
  http://localhost:8080/api/path/to/endpoint
```

#### JavaScript (fetch) Example
```javascript
const response = await fetch('http://localhost:8080/api/path/to/endpoint', {
  method: 'HTTP_METHOD',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer <your-token>'
  },
  body: JSON.stringify({
    field1: 'example',
    field2: 123
  })
});
const result = await response.json();
```

### 5. Notes and Considerations

- Any special considerations for this endpoint
- Rate limiting information
- Caching behavior
- Side effects of calling this endpoint

---

## Standard Response Format

All API responses follow the standard `Result` format:

```json
{
  "code": 200,
  "message": "Success message",
  "data": {} // Actual response data or null
}
```

### Common Status Codes
| Code | Message | Description |
|------|---------|-------------|
| `200` | Success | Operation completed successfully |
| `201` | Created | Resource created successfully |
| `400` | Bad Request | Invalid request parameters |
| `401` | Unauthorized | Authentication required |
| `403` | Forbidden | Insufficient permissions |
| `404` | Not Found | Resource not found |
| `500` | Internal Error | Server error occurred |

## Authentication

All protected endpoints require a valid JWT token in the `Authorization` header:

```
Authorization: Bearer <jwt-token>
```

Tokens are obtained through the `/api/auth/login` endpoint.

## Pagination

For endpoints that return lists, standard pagination is supported:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `page` | `1` | Page number (1-based) |
| `size` | `10` | Number of items per page |
| `sort` | None | Sort field and direction (e.g., `name,asc`) |

## Error Handling

All errors return a consistent error format with appropriate HTTP status codes and descriptive messages.

## Versioning

API versioning is handled through the base path:
- Current version: `/api/` (v1)
- Future versions: `/api/v2/`, etc.

---
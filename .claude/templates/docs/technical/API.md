<!--
DOCUMENT METADATA
Owner: @backend-developer
Update trigger: Any API endpoint is added, modified, or removed
Update scope: Full document
Read by: @frontend-developer (to know what endpoints to call and their contracts),
          @qa-engineer (for API contract testing)
-->

# API Reference

> **Base URL**: `[https://api.example.com/v1]` (production) · `[http://localhost:3000/api]` (local)
> **Authentication**: Bearer token in `Authorization` header, or session cookie
> **Content-Type**: `application/json` for all requests and responses
> **Last updated**: [YYYY-MM-DD]

---

## Authentication

### How to Authenticate

[Describe the authentication mechanism — e.g.:]

Include the session token in every request:
```
Authorization: Bearer <token>
```

Tokens are obtained via the login endpoint and expire after [30 days / X hours].

### Obtaining a Token

See `POST /auth/login` below.

---

## Standard Error Format

All error responses follow this structure:

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable description",
    "details": [
      { "field": "email", "message": "Invalid email format" }
    ]
  }
}
```

**Common error codes**:
| HTTP Status | Code | Meaning |
|-------------|------|---------|
| 400 | `VALIDATION_ERROR` | Request body or params failed validation |
| 401 | `UNAUTHENTICATED` | No valid auth token provided |
| 403 | `UNAUTHORIZED` | Authenticated but insufficient permissions |
| 404 | `NOT_FOUND` | Resource does not exist |
| 409 | `CONFLICT` | Duplicate resource or state conflict |
| 422 | `UNPROCESSABLE` | Request understood but cannot be processed |
| 429 | `RATE_LIMITED` | Too many requests |
| 500 | `INTERNAL_ERROR` | Server-side error |

---

## Rate Limiting

- **Limit**: [100 requests per minute per IP / user]
- **Headers returned**:
  - `X-RateLimit-Limit` — requests allowed per window
  - `X-RateLimit-Remaining` — requests remaining in current window
  - `X-RateLimit-Reset` — Unix timestamp when window resets

---

## Endpoints

---

### Auth

#### POST /auth/register

**Auth required**: No
**Description**: Create a new user account.

**Request body**:
```json
{
  "email": "string — valid email address",
  "password": "string — minimum 8 characters",
  "name": "string — display name"
}
```

**Response 201**:
```json
{
  "user": {
    "id": "uuid",
    "email": "string",
    "name": "string",
    "createdAt": "ISO 8601 datetime"
  }
}
```

**Error codes**: `400` (validation), `409` (email already registered)

---

#### POST /auth/login

**Auth required**: No
**Description**: Authenticate with email and password. Returns a session token.

**Request body**:
```json
{
  "email": "string",
  "password": "string"
}
```

**Response 200**:
```json
{
  "token": "string — JWT or session token",
  "expiresAt": "ISO 8601 datetime",
  "user": {
    "id": "uuid",
    "email": "string",
    "name": "string"
  }
}
```

**Error codes**: `400` (validation), `401` (invalid credentials)

---

#### POST /auth/logout

**Auth required**: Yes
**Description**: Invalidate the current session token.

**Request body**: None

**Response 204**: No content

---

#### POST /auth/password-reset/request

**Auth required**: No
**Description**: Send a password reset email to the specified address.

**Request body**:
```json
{
  "email": "string"
}
```

**Response 200**: Always returns 200 to prevent email enumeration.
```json
{
  "message": "If an account exists, a reset email has been sent."
}
```

---

### [Resource: e.g., Users]

#### GET /users/me

**Auth required**: Yes
**Description**: Return the authenticated user's profile.

**Response 200**:
```json
{
  "id": "uuid",
  "email": "string",
  "name": "string",
  "role": "string",
  "createdAt": "ISO 8601 datetime",
  "updatedAt": "ISO 8601 datetime"
}
```

---

#### PATCH /users/me

**Auth required**: Yes
**Description**: Update the authenticated user's profile fields.

**Request body** (all fields optional):
```json
{
  "name": "string"
}
```

**Response 200**: Returns updated user object (same shape as GET /users/me)

**Error codes**: `400` (validation)

---

### [Resource 2: add sections below as endpoints are built]

---

## Changelog

| Date | Change |
|------|--------|
| [YYYY-MM-DD] | Initial API definition — auth endpoints |

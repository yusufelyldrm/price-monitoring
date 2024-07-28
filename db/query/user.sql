-- name: CreateUser :one
INSERT INTO users (username, email, password, created_at)
VALUES ($1, $2, $3, NOW())
    RETURNING id, username, email, created_at;

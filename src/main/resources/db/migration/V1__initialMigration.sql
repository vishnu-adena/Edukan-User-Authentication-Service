CREATE TABLE role
(
    id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    deleted   BOOLEAN                                 NOT NULL,
    role_name VARCHAR(255),
    CONSTRAINT pk_role PRIMARY KEY (id)
);

CREATE TABLE token
(
    id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    deleted   BOOLEAN                                 NOT NULL,
    token     VARCHAR(255),
    user_id   BIGINT,
    expire_at TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT pk_token PRIMARY KEY (id)
);

CREATE TABLE users
(
    id                BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    deleted           BOOLEAN                                 NOT NULL,
    name              VARCHAR(255),
    email             VARCHAR(255),
    hashed_password   VARCHAR(255),
    is_email_verified BOOLEAN                                 NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE TABLE users_roles
(
    users_id BIGINT NOT NULL,
    roles_id BIGINT NOT NULL
);

ALTER TABLE token
    ADD CONSTRAINT FK_TOKEN_ON_USER FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE users_roles
    ADD CONSTRAINT fk_userol_on_role FOREIGN KEY (roles_id) REFERENCES role (id);

ALTER TABLE users_roles
    ADD CONSTRAINT fk_userol_on_users FOREIGN KEY (users_id) REFERENCES users (id);
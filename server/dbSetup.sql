CREATE TABLE
  IF NOT EXISTS accounts (
    id VARCHAR(255) NOT NULL PRIMARY KEY COMMENT 'primary key',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
    name VARCHAR(255) COMMENT 'User Name',
    email VARCHAR(255) UNIQUE COMMENT 'User Email',
    picture VARCHAR(255) COMMENT 'User Picture'
  ) DEFAULT charset utf8mb4 COMMENT '';

CREATE TABLE
  keeps (
    id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    img_url VARCHAR(1000) NOT NULL,
    views INT UNSIGNED NOT NULL DEFAULT 0,
    creator_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES accounts (id) ON DELETE CASCADE
  );

CREATE TABLE
  vaults (
    id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    img_url VARCHAR(1000) NOT NULL,
    is_private BOOLEAN NOT NULL,
    creator_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES accounts (id) ON DELETE CASCADE
  );

CREATE TABLE
  vault_keeps (
    id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    keep_id INT NOT NULL,
    vault_id INT NOT NULL,
    FOREIGN KEY (keep_id) REFERENCES keeps (id) ON DELETE CASCADE,
    FOREIGN KEY (vault_id) REFERENCES vaults (id) ON DELETE CASCADE
  );

INSERT INTO
  keeps (name, description, img_url, creator_id)
VALUES
  (
    'Beach Bum',
    'He rolled in a dead fish',
    'https://images.unsplash.com/photo-1587300003388-59208cc962cb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    '670ff93326693293c631476f'
  );

SELECT
  *
FROM
  accounts;

SELECT
  keeps.id,
  keeps.name,
  img_url,
  creator_id,
  accounts.name AS creator_name,
  accounts.picture AS creator_picture
FROM
  keeps
  INNER JOIN accounts ON accounts.id = creator_id;

CREATE VIEW
  keeps_with_creators AS
SELECT
  keeps.id,
  keeps.name,
  img_url,
  creator_id,
  accounts.name AS creator_name,
  accounts.picture AS creator_picture
FROM
  keeps
  INNER JOIN accounts ON accounts.id = creator_id
ORDER BY
  keeps.created_at;

SELECT
  keeps.id,
  keeps.name,
  img_url,
  creator_id,
  description,
  views,
  accounts.name AS creator_name,
  accounts.picture AS creator_picture,
  COUNT(vault_keeps.id) AS kept
FROM
  keeps
  INNER JOIN accounts ON accounts.id = creator_id
  LEFT JOIN vault_keeps ON keeps.id = keep_id
GROUP BY
  keeps.id;
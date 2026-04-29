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
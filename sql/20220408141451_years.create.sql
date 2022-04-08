CREATE TABLE IF NOT EXISTS years (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `year` VARCHAR(10) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at DATETIME
);

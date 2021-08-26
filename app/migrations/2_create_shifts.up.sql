CREATE TABLE IF NOT EXISTS shifts(
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  time_id INT NOT NULL,
  work_id INT NOT NULL,
  weather_id INT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

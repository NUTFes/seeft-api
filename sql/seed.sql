INSERT INTO weathers
  (`weather`)
VALUES
  ('晴れ'),
  ('雨');

INSERT INTO times
  (`time`)
VALUES
  ('6:00'),
  ('6:30'),
  ('7:00'),
  ('7:30'),
  ('8:00'),
  ('8:30'),
  ('9:00'),
  ('9:30'),
  ('10:00'),
  ('10:30'),
  ('11:00'),
  ('11:30'),
  ('12:00'),
  ('12:30'),
  ('13:00'),
  ('13:30'),
  ('14:00'),
  ('14:30'),
  ('15:00'),
  ('15:30'),
  ('16:00'),
  ('16:30'),
  ('17:00'),
  ('17:30'),
  ('18:00'),
  ('18:30'),
  ('19:00'),
  ('19:30'),
  ('20:00'),
  ('20:30'),
  ('21:00'),
  ('21:30');
  
INSERT INTO grades
  (`grade`)
VALUES
  ('B1'),
  ('B2'),
  ('B3'),
  ('B4'),
  ('M1'),
  ('M2'),
  ('D1'),
  ('D2'),
  ('OB');

INSERT INTO dates
  (`date`)
VALUES
  ('準備日'),
  ('1日目'),
  ('2日目'),
  ('片付け日');

INSERT INTO bureaus
  (`bureau`)
VALUES
  ('委員長'),
  ('副委員長'),
  ('総務局'),
  ('企画局'),
  ('渉外局'),
  ('財務局'),
  ('制作局'),
  ('情報局');

INSERT INTO years
  (id, `year`)
VALUES
  (40, 2021),
  (41, 2022);

INSERT INTO users
  (`name`,`mail`, `bureau_id`, `grade_id`)
VALUES
  ('Admin', 'admin@nutfes.net', 14, 8);

INSERT INTO permissions
  (`user_id`, `allow_shift`, `allow_task`, `allow_user`, `allow_property`)
VALUES
  (1, True, True, True, True);

-- 以下テスト用のデータなので本番環境で起こらないようにする
INSERT INTO tasks
  (`task`, `place`, `url`, `superviser`, `notes`, `created_user_id`, `updated_user_id`, `year_id`)
VALUES
  ('テスト1', '24', 'https://example.com', 'Admin', '', 1, 1, 1),
  ('テスト2', '体育館', 'https://example.com', 'Admin', '', 1, 1, 1),
  ('テスト3', 'D講', 'https://nutfes.net', 'Admin', '', 1, 1, 1);

INSERT INTO shifts
  (user_id, task_id, year_id, date_id, time_id, weather_id, created_user_id, updated_user_id)
VALUES
  (1, 1, 1, 1, 1, 1, 1, 1),
  (1, 1, 1, 1, 2, 1, 1, 1),
  (1, 1, 1, 1, 3, 1, 1, 1),
  (1, 2, 1, 1, 4, 1, 1, 1),
  (1, 2, 1, 1, 5, 1, 1, 1),
  (1, 2, 1, 1, 6, 1, 1, 1),
  (1, 1, 1, 1, 7, 1, 1, 1),
  (1, 1, 1, 1, 8, 1, 1, 1),
  (1, 3, 1, 1, 9, 1, 1, 1),
  (1, 3, 1, 1, 10, 1, 1, 1),
  (1, 3, 1, 1, 11, 1, 1, 1),
  (1, 3, 1, 1, 12, 1, 1, 1);

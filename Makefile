.PHONY: seed

seed:
	docker compose run --rm server dart run ./sql/sql.dart seed
	docker compose run --rm server dart run ./sql/sql.dart user --csv ./sql/user.csv
  docker compose run --rm server dart run ./sql/sql.dart task --csv ./sql/task.csv
  docker compose run --rm server dart run ./sql/sql.dart task --csv ./sql/task_kikaku.csv
  docker compose run --rm server dart run ./sql/sql.dart shift --csv ./sql/41st_shift_pre_sunny.csv -y41 -dpre -wsunny
  docker compose run --rm server dart run ./sql/sql.dart shift --csv ./sql/41st_shift_1_sunny.csv -y41 -dpre -wsunny
  docker compose run --rm server dart run ./sql/sql.dart shift --csv ./sql/41st_shift_2_sunny.csv -y41 -dpre -wsunny


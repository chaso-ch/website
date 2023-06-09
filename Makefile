update:
	pip-compile -U --no-header --no-annotate --strip-extras --resolver backtracking
	pip-sync

.PHONY: publish
publish:
		flutter packages pub publish

.PHONY: analyze
analyze:
		flutter analyze

.PHONY: start
start:
		flutter doctor
		fluttr clean
		flutter pub get
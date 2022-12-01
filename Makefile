.PHONY: upgrade all libraries to null-safety versions.

update-null-safety:
 @echo update to null safety
 @dart pub upgrade --null-safety

only-upd-libraries:
 @dart pub upgrade --null-safety --dry-run

get:
 @echo running flutter get packages 
 @flutter pub get

gen-build-delete:
 @flutter pub run build_runner watch  --delete-conflicting-outputs

spider-watch:
 @spider build --watch

build-watch: 
 @flutter pub run build_runner watch

linter-analyze:
 @flutter pub run dart_code_metrics:metrics analyze lib

linter:
 @flutter pub run dart_code_metrics:metrics analyze lib \
 --exclude={/**.g.dart,/**.gr.dart,/**.gen.dart,/**.freezed.dart,/**.template.dart}
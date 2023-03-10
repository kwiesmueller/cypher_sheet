protoc -I=proto --dart_out=grpc:lib/proto --plugin=protoc-gen-dart=protoc-gen-dart proto/character.proto
protoc -I=proto --dart_out=grpc:lib/proto --plugin=protoc-gen-dart=protoc-gen-dart proto/characters.proto

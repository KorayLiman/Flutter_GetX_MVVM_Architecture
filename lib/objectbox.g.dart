// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'product/model/local_storage_models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3452068481205201249),
      name: 'AppUser',
      lastPropertyId: const IdUid(4, 6144438506391140977),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8299190266649731395),
            name: 'entityId',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 114889974012162628),
            name: 'id',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3542661297096527627),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6144438506391140977),
            name: 'surname',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 3452068481205201249),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    AppUser: EntityDefinition<AppUser>(
        model: _entities[0],
        toOneRelations: (AppUser object) => [],
        toManyRelations: (AppUser object) => {},
        getId: (AppUser object) => object.entityId,
        setId: (AppUser object, int id) {
          object.entityId = id;
        },
        objectToFB: (AppUser object, fb.Builder fbb) {
          final idOffset =
              object.id == null ? null : fbb.writeString(object.id!);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final surnameOffset =
              object.surname == null ? null : fbb.writeString(object.surname!);
          fbb.startTable(5);
          fbb.addInt64(0, object.entityId);
          fbb.addOffset(1, idOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, surnameOffset);
          fbb.finish(fbb.endTable());
          return object.entityId;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = AppUser(
              id: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              surname: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10))
            ..entityId =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [AppUser] entity fields to define ObjectBox queries.
class AppUser_ {
  /// see [AppUser.entityId]
  static final entityId =
      QueryIntegerProperty<AppUser>(_entities[0].properties[0]);

  /// see [AppUser.id]
  static final id = QueryStringProperty<AppUser>(_entities[0].properties[1]);

  /// see [AppUser.name]
  static final name = QueryStringProperty<AppUser>(_entities[0].properties[2]);

  /// see [AppUser.surname]
  static final surname =
      QueryStringProperty<AppUser>(_entities[0].properties[3]);
}

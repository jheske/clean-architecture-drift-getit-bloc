// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../app_database_impl.dart';

// ignore_for_file: type=lint
class User extends Table with TableInfo<User, UserTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  User(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _musicStyleMeta =
      const VerificationMeta('musicStyle');
  late final GeneratedColumn<String> musicStyle = GeneratedColumn<String>(
      'music_style', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _favoriteSongNameMeta =
      const VerificationMeta('favoriteSongName');
  late final GeneratedColumn<String> favoriteSongName = GeneratedColumn<String>(
      'favorite_song_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, musicStyle, favoriteSongName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('music_style')) {
      context.handle(
          _musicStyleMeta,
          musicStyle.isAcceptableOrUnknown(
              data['music_style']!, _musicStyleMeta));
    } else if (isInserting) {
      context.missing(_musicStyleMeta);
    }
    if (data.containsKey('favorite_song_name')) {
      context.handle(
          _favoriteSongNameMeta,
          favoriteSongName.isAcceptableOrUnknown(
              data['favorite_song_name']!, _favoriteSongNameMeta));
    } else if (isInserting) {
      context.missing(_favoriteSongNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      musicStyle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}music_style'])!,
      favoriteSongName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}favorite_song_name'])!,
    );
  }

  @override
  User createAlias(String alias) {
    return User(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserTable extends DataClass implements Insertable<UserTable> {
  final int id;
  final String username;
  final String musicStyle;
  final String favoriteSongName;
  const UserTable(
      {required this.id,
      required this.username,
      required this.musicStyle,
      required this.favoriteSongName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['music_style'] = Variable<String>(musicStyle);
    map['favorite_song_name'] = Variable<String>(favoriteSongName);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      username: Value(username),
      musicStyle: Value(musicStyle),
      favoriteSongName: Value(favoriteSongName),
    );
  }

  factory UserTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTable(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      musicStyle: serializer.fromJson<String>(json['music_style']),
      favoriteSongName: serializer.fromJson<String>(json['favorite_song_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'music_style': serializer.toJson<String>(musicStyle),
      'favorite_song_name': serializer.toJson<String>(favoriteSongName),
    };
  }

  UserTable copyWith(
          {int? id,
          String? username,
          String? musicStyle,
          String? favoriteSongName}) =>
      UserTable(
        id: id ?? this.id,
        username: username ?? this.username,
        musicStyle: musicStyle ?? this.musicStyle,
        favoriteSongName: favoriteSongName ?? this.favoriteSongName,
      );
  @override
  String toString() {
    return (StringBuffer('UserTable(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('favoriteSongName: $favoriteSongName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, musicStyle, favoriteSongName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTable &&
          other.id == this.id &&
          other.username == this.username &&
          other.musicStyle == this.musicStyle &&
          other.favoriteSongName == this.favoriteSongName);
}

class UserCompanion extends UpdateCompanion<UserTable> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> musicStyle;
  final Value<String> favoriteSongName;
  const UserCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.musicStyle = const Value.absent(),
    this.favoriteSongName = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String musicStyle,
    required String favoriteSongName,
  })  : username = Value(username),
        musicStyle = Value(musicStyle),
        favoriteSongName = Value(favoriteSongName);
  static Insertable<UserTable> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? musicStyle,
    Expression<String>? favoriteSongName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (musicStyle != null) 'music_style': musicStyle,
      if (favoriteSongName != null) 'favorite_song_name': favoriteSongName,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? musicStyle,
      Value<String>? favoriteSongName}) {
    return UserCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      musicStyle: musicStyle ?? this.musicStyle,
      favoriteSongName: favoriteSongName ?? this.favoriteSongName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (musicStyle.present) {
      map['music_style'] = Variable<String>(musicStyle.value);
    }
    if (favoriteSongName.present) {
      map['favorite_song_name'] = Variable<String>(favoriteSongName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('favoriteSongName: $favoriteSongName')
          ..write(')'))
        .toString();
  }
}

class Artist extends Table with TableInfo<Artist, ArtistData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Artist(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _musicStyleMeta =
      const VerificationMeta('musicStyle');
  late final GeneratedColumn<String> musicStyle = GeneratedColumn<String>(
      'music_style', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
      'is_active', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [id, name, age, musicStyle, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artist';
  @override
  VerificationContext validateIntegrity(Insertable<ArtistData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('music_style')) {
      context.handle(
          _musicStyleMeta,
          musicStyle.isAcceptableOrUnknown(
              data['music_style']!, _musicStyleMeta));
    } else if (isInserting) {
      context.missing(_musicStyleMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArtistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArtistData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      musicStyle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}music_style'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_active']),
    );
  }

  @override
  Artist createAlias(String alias) {
    return Artist(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ArtistData extends DataClass implements Insertable<ArtistData> {
  final int id;
  final String name;
  final int age;
  final String musicStyle;
  final int? isActive;
  const ArtistData(
      {required this.id,
      required this.name,
      required this.age,
      required this.musicStyle,
      this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['music_style'] = Variable<String>(musicStyle);
    if (!nullToAbsent || isActive != null) {
      map['is_active'] = Variable<int>(isActive);
    }
    return map;
  }

  ArtistCompanion toCompanion(bool nullToAbsent) {
    return ArtistCompanion(
      id: Value(id),
      name: Value(name),
      age: Value(age),
      musicStyle: Value(musicStyle),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
    );
  }

  factory ArtistData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtistData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      musicStyle: serializer.fromJson<String>(json['music_style']),
      isActive: serializer.fromJson<int?>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'music_style': serializer.toJson<String>(musicStyle),
      'is_active': serializer.toJson<int?>(isActive),
    };
  }

  ArtistData copyWith(
          {int? id,
          String? name,
          int? age,
          String? musicStyle,
          Value<int?> isActive = const Value.absent()}) =>
      ArtistData(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        musicStyle: musicStyle ?? this.musicStyle,
        isActive: isActive.present ? isActive.value : this.isActive,
      );
  @override
  String toString() {
    return (StringBuffer('ArtistData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, age, musicStyle, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtistData &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.musicStyle == this.musicStyle &&
          other.isActive == this.isActive);
}

class ArtistCompanion extends UpdateCompanion<ArtistData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> age;
  final Value<String> musicStyle;
  final Value<int?> isActive;
  const ArtistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.musicStyle = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ArtistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int age,
    required String musicStyle,
    this.isActive = const Value.absent(),
  })  : name = Value(name),
        age = Value(age),
        musicStyle = Value(musicStyle);
  static Insertable<ArtistData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? musicStyle,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (musicStyle != null) 'music_style': musicStyle,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ArtistCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? age,
      Value<String>? musicStyle,
      Value<int?>? isActive}) {
    return ArtistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      musicStyle: musicStyle ?? this.musicStyle,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (musicStyle.present) {
      map['music_style'] = Variable<String>(musicStyle.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Song extends Table with TableInfo<Song, SongTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Song(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
      'genre', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
      'album', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _artistIdMeta =
      const VerificationMeta('artistId');
  late final GeneratedColumn<int> artistId = GeneratedColumn<int>(
      'artistId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES artist(id)ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, duration, genre, album, artistId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'song';
  @override
  VerificationContext validateIntegrity(Insertable<SongTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('genre')) {
      context.handle(
          _genreMeta, genre.isAcceptableOrUnknown(data['genre']!, _genreMeta));
    }
    if (data.containsKey('album')) {
      context.handle(
          _albumMeta, album.isAcceptableOrUnknown(data['album']!, _albumMeta));
    }
    if (data.containsKey('artistId')) {
      context.handle(_artistIdMeta,
          artistId.isAcceptableOrUnknown(data['artistId']!, _artistIdMeta));
    } else if (isInserting) {
      context.missing(_artistIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SongTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      genre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre']),
      album: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}album']),
      artistId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}artistId'])!,
    );
  }

  @override
  Song createAlias(String alias) {
    return Song(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SongTable extends DataClass implements Insertable<SongTable> {
  final int id;
  final String name;
  final int? duration;
  final String? genre;
  final String? album;
  final int artistId;
  const SongTable(
      {required this.id,
      required this.name,
      this.duration,
      this.genre,
      this.album,
      required this.artistId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || genre != null) {
      map['genre'] = Variable<String>(genre);
    }
    if (!nullToAbsent || album != null) {
      map['album'] = Variable<String>(album);
    }
    map['artistId'] = Variable<int>(artistId);
    return map;
  }

  SongCompanion toCompanion(bool nullToAbsent) {
    return SongCompanion(
      id: Value(id),
      name: Value(name),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      genre:
          genre == null && nullToAbsent ? const Value.absent() : Value(genre),
      album:
          album == null && nullToAbsent ? const Value.absent() : Value(album),
      artistId: Value(artistId),
    );
  }

  factory SongTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      duration: serializer.fromJson<int?>(json['duration']),
      genre: serializer.fromJson<String?>(json['genre']),
      album: serializer.fromJson<String?>(json['album']),
      artistId: serializer.fromJson<int>(json['artistId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'duration': serializer.toJson<int?>(duration),
      'genre': serializer.toJson<String?>(genre),
      'album': serializer.toJson<String?>(album),
      'artistId': serializer.toJson<int>(artistId),
    };
  }

  SongTable copyWith(
          {int? id,
          String? name,
          Value<int?> duration = const Value.absent(),
          Value<String?> genre = const Value.absent(),
          Value<String?> album = const Value.absent(),
          int? artistId}) =>
      SongTable(
        id: id ?? this.id,
        name: name ?? this.name,
        duration: duration.present ? duration.value : this.duration,
        genre: genre.present ? genre.value : this.genre,
        album: album.present ? album.value : this.album,
        artistId: artistId ?? this.artistId,
      );
  @override
  String toString() {
    return (StringBuffer('SongTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('duration: $duration, ')
          ..write('genre: $genre, ')
          ..write('album: $album, ')
          ..write('artistId: $artistId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, duration, genre, album, artistId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.duration == this.duration &&
          other.genre == this.genre &&
          other.album == this.album &&
          other.artistId == this.artistId);
}

class SongCompanion extends UpdateCompanion<SongTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> duration;
  final Value<String?> genre;
  final Value<String?> album;
  final Value<int> artistId;
  const SongCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.duration = const Value.absent(),
    this.genre = const Value.absent(),
    this.album = const Value.absent(),
    this.artistId = const Value.absent(),
  });
  SongCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.duration = const Value.absent(),
    this.genre = const Value.absent(),
    this.album = const Value.absent(),
    required int artistId,
  })  : name = Value(name),
        artistId = Value(artistId);
  static Insertable<SongTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? duration,
    Expression<String>? genre,
    Expression<String>? album,
    Expression<int>? artistId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (duration != null) 'duration': duration,
      if (genre != null) 'genre': genre,
      if (album != null) 'album': album,
      if (artistId != null) 'artistId': artistId,
    });
  }

  SongCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? duration,
      Value<String?>? genre,
      Value<String?>? album,
      Value<int>? artistId}) {
    return SongCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      genre: genre ?? this.genre,
      album: album ?? this.album,
      artistId: artistId ?? this.artistId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (artistId.present) {
      map['artistId'] = Variable<int>(artistId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('duration: $duration, ')
          ..write('genre: $genre, ')
          ..write('album: $album, ')
          ..write('artistId: $artistId')
          ..write(')'))
        .toString();
  }
}

class Playlist extends Table with TableInfo<Playlist, PlaylistTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Playlist(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES user(id)ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [id, name, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlist';
  @override
  VerificationContext validateIntegrity(Insertable<PlaylistTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId},
      ];
  @override
  PlaylistTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  Playlist createAlias(String alias) {
    return Playlist(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT unique_user_playlist UNIQUE(user_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class PlaylistTable extends DataClass implements Insertable<PlaylistTable> {
  final int id;
  final String name;
  final int userId;
  const PlaylistTable(
      {required this.id, required this.name, required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  PlaylistCompanion toCompanion(bool nullToAbsent) {
    return PlaylistCompanion(
      id: Value(id),
      name: Value(name),
      userId: Value(userId),
    );
  }

  factory PlaylistTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userId: serializer.fromJson<int>(json['user_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'user_id': serializer.toJson<int>(userId),
    };
  }

  PlaylistTable copyWith({int? id, String? name, int? userId}) => PlaylistTable(
        id: id ?? this.id,
        name: name ?? this.name,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('PlaylistTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.userId == this.userId);
}

class PlaylistCompanion extends UpdateCompanion<PlaylistTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> userId;
  const PlaylistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
  });
  PlaylistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int userId,
  })  : name = Value(name),
        userId = Value(userId);
  static Insertable<PlaylistTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userId != null) 'user_id': userId,
    });
  }

  PlaylistCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? userId}) {
    return PlaylistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class PlaylistWithSongs extends Table
    with TableInfo<PlaylistWithSongs, PlaylistWithSongsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PlaylistWithSongs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  late final GeneratedColumn<int> songId = GeneratedColumn<int>(
      'song_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES song(id)');
  static const VerificationMeta _playlistIdMeta =
      const VerificationMeta('playlistId');
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
      'playlist_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES playlist(id)');
  @override
  List<GeneratedColumn> get $columns => [id, songId, playlistId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'playlistWithSongs';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlaylistWithSongsTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('song_id')) {
      context.handle(_songIdMeta,
          songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta));
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
          _playlistIdMeta,
          playlistId.isAcceptableOrUnknown(
              data['playlist_id']!, _playlistIdMeta));
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {songId, playlistId},
      ];
  @override
  PlaylistWithSongsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistWithSongsTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}song_id'])!,
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}playlist_id'])!,
    );
  }

  @override
  PlaylistWithSongs createAlias(String alias) {
    return PlaylistWithSongs(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT songIdWithPlaylistId UNIQUE(song_id, playlist_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class PlaylistWithSongsTable extends DataClass
    implements Insertable<PlaylistWithSongsTable> {
  final int id;
  final int songId;
  final int playlistId;
  const PlaylistWithSongsTable(
      {required this.id, required this.songId, required this.playlistId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['song_id'] = Variable<int>(songId);
    map['playlist_id'] = Variable<int>(playlistId);
    return map;
  }

  PlaylistWithSongsCompanion toCompanion(bool nullToAbsent) {
    return PlaylistWithSongsCompanion(
      id: Value(id),
      songId: Value(songId),
      playlistId: Value(playlistId),
    );
  }

  factory PlaylistWithSongsTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistWithSongsTable(
      id: serializer.fromJson<int>(json['id']),
      songId: serializer.fromJson<int>(json['song_id']),
      playlistId: serializer.fromJson<int>(json['playlist_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'song_id': serializer.toJson<int>(songId),
      'playlist_id': serializer.toJson<int>(playlistId),
    };
  }

  PlaylistWithSongsTable copyWith({int? id, int? songId, int? playlistId}) =>
      PlaylistWithSongsTable(
        id: id ?? this.id,
        songId: songId ?? this.songId,
        playlistId: playlistId ?? this.playlistId,
      );
  @override
  String toString() {
    return (StringBuffer('PlaylistWithSongsTable(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('playlistId: $playlistId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, songId, playlistId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistWithSongsTable &&
          other.id == this.id &&
          other.songId == this.songId &&
          other.playlistId == this.playlistId);
}

class PlaylistWithSongsCompanion
    extends UpdateCompanion<PlaylistWithSongsTable> {
  final Value<int> id;
  final Value<int> songId;
  final Value<int> playlistId;
  const PlaylistWithSongsCompanion({
    this.id = const Value.absent(),
    this.songId = const Value.absent(),
    this.playlistId = const Value.absent(),
  });
  PlaylistWithSongsCompanion.insert({
    this.id = const Value.absent(),
    required int songId,
    required int playlistId,
  })  : songId = Value(songId),
        playlistId = Value(playlistId);
  static Insertable<PlaylistWithSongsTable> custom({
    Expression<int>? id,
    Expression<int>? songId,
    Expression<int>? playlistId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (songId != null) 'song_id': songId,
      if (playlistId != null) 'playlist_id': playlistId,
    });
  }

  PlaylistWithSongsCompanion copyWith(
      {Value<int>? id, Value<int>? songId, Value<int>? playlistId}) {
    return PlaylistWithSongsCompanion(
      id: id ?? this.id,
      songId: songId ?? this.songId,
      playlistId: playlistId ?? this.playlistId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<int>(songId.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistWithSongsCompanion(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('playlistId: $playlistId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabaseImpl extends GeneratedDatabase {
  _$AppDatabaseImpl(QueryExecutor e) : super(e);
  late final User user = User(this);
  late final Artist artist = Artist(this);
  late final Song song = Song(this);
  late final Playlist playlist = Playlist(this);
  late final PlaylistWithSongs playlistWithSongs = PlaylistWithSongs(this);
  Selectable<UserTable> _getUsers() {
    return customSelect('SELECT * FROM user', variables: [], readsFrom: {
      user,
    }).asyncMap(user.mapFromRow);
  }

  Selectable<UserTable> _getUserById(int id) {
    return customSelect('SELECT * FROM user WHERE id = ?1 LIMIT 1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      user,
    }).asyncMap(user.mapFromRow);
  }

  Selectable<ArtistData> _getArtists() {
    return customSelect('SELECT * FROM artist', variables: [], readsFrom: {
      artist,
    }).asyncMap(artist.mapFromRow);
  }

  Selectable<ArtistData> _getArtistById(int id) {
    return customSelect('SELECT * FROM artist WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          artist,
        }).asyncMap(artist.mapFromRow);
  }

  Selectable<SongTable> _getSongs() {
    return customSelect('SELECT * FROM song', variables: [], readsFrom: {
      song,
    }).asyncMap(song.mapFromRow);
  }

  Selectable<SongTable> _getSongById(int id) {
    return customSelect('SELECT * FROM song WHERE id = ?1 LIMIT 1', variables: [
      Variable<int>(id)
    ], readsFrom: {
      song,
    }).asyncMap(song.mapFromRow);
  }

  Future<int> _insertUser(
      int id, String username, String musicStyle, String favoriteSongName) {
    return customInsert(
      'INSERT INTO user (id, username, music_style, favorite_song_name) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<int>(id),
        Variable<String>(username),
        Variable<String>(musicStyle),
        Variable<String>(favoriteSongName)
      ],
      updates: {user},
    );
  }

  Future<int> _insertArtist(
      int id, String name, int age, String musicStyle, int? isActive) {
    return customInsert(
      'INSERT INTO artist (id, name, age, music_style, is_active) VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<int>(id),
        Variable<String>(name),
        Variable<int>(age),
        Variable<String>(musicStyle),
        Variable<int>(isActive)
      ],
      updates: {artist},
    );
  }

  Future<int> _insertSong(int id, String name, int? duration, String? genre,
      String? album, int artistId) {
    return customInsert(
      'INSERT INTO song (id, name, duration, genre, album, artistId) VALUES (?1, ?2, ?3, ?4, ?5, ?6)',
      variables: [
        Variable<int>(id),
        Variable<String>(name),
        Variable<int>(duration),
        Variable<String>(genre),
        Variable<String>(album),
        Variable<int>(artistId)
      ],
      updates: {song},
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [user, artist, song, playlist, playlistWithSongs];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('artist',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('song', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('user',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('playlist', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

// Tables are defined in schema.drift and represent sql tables.
// Table classes are generated by the @DriftDatabase can be found in app_database_impl.g.dart.
// They are usually called "Entities" and they contain the database-specific utility
// classes and methods including toJson, fromJson, copyWith and others.
// In this architecture, Models are the bridge between low-level database Table classes and
// domain-specific Entities.
// These typedefs are convenience names for the architecture. The Domain layer
// will transform Model classes into Entity classes for use in the Presentation layer.
// The Presentation layer can use Entities directly. Some applications
// abstract even further by creating usecase-specific ViewModel classes UI Widgets, containing
// only the logic required for those Widgets.
import '../database/app_database_impl.dart';

typedef UserModel = UserTable;
typedef SongModel = SongTable;
typedef ArtistModel = ArtistTable;

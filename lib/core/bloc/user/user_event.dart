abstract class LocalUserEvent {
  final int? id;

  const LocalUserEvent({this.id});
}

class GetUser extends LocalUserEvent {
  const GetUser(int id) : super(id: id);
}

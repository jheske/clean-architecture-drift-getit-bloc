abstract class LocalUserEvent {
  final int? id;

  const LocalUserEvent({this.id = 0});
}

class GetUser extends LocalUserEvent {
  const GetUser({super.id = null});
}

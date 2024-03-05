// TODO Equatable??
class UserEvent {}

class GetUser extends UserEvent {
  final int id;

  GetUser({
    required this.id,
  });
}

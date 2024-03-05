// TODO Equatable??
class UserEvent {
  // final int? id;
  //
  // const UserEvent({this.id = 0});
  // void addUserId(int? id) {
  //   id = id;
  // }
}

class GetUser extends UserEvent {
  final int id;

  GetUser({
    required this.id,
  });
}

//
// class GetUser extends UserEvent {
//   final int id;
//
//   const GetUser(this.id) : super(id: id);
// }

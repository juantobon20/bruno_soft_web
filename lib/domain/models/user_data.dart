import 'sortable.dart';

class UserData implements Sortable {
  final int id;
  final int roleId;
  final int neighborhoodId;
  final String identification;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final bool state;

  String get fullName => "$firstName $lastName";

  UserData({
    required this.id, 
    required this.roleId, 
    required this.neighborhoodId, 
    required this.identification, 
    required this.firstName, 
    required this.lastName, 
    required this.phone, 
    required this.email, 
    required this.state
  });
  
  @override
  int compareByColumn(Sortable other, int columnIndex) {
    if (other is! UserData) {
      throw ArgumentError('Comparando Usuario con un tipo diferente');
    }

    switch(columnIndex) {
      case 1:
        return firstName.compareTo(other.firstName);
      case 2:
        return lastName.compareTo(other.lastName);
      case 6:
        if (state == other.state) {
          return 0;
        } else if (state) {
          return 1;
        } else {
          return -1;
        }
      default:
        return 0;
    }
  }
  
}
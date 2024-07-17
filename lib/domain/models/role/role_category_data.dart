import '../sortable.dart';

class RoleCategoryData implements Sortable {

  final int id;
  final String name;
  final bool state;

  RoleCategoryData({
    required this.id, 
    required this.name, 
    required this.state
  });
  
  @override
  int compareByColumn(Sortable other, int columnIndex) {
    if (other is! RoleCategoryData) {
      throw ArgumentError('Comparando Rol con un tipo diferente');
    }

    switch(columnIndex) {
      case 0:
        return id.compareTo(other.id);
      case 1:
        return name.compareTo(other.name);
      case 2:
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
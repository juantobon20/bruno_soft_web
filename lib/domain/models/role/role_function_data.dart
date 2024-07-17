import '../sortable.dart';

class RoleFunctionData implements Sortable {
    final int id;
    final int roleCategoryId;
    final String roleCategoryName;
    final String code;
    final String description;

    RoleFunctionData({
      required this.id,
      required this.roleCategoryId,
      required this.roleCategoryName,
      required this.code,
      required this.description,
    });
    
      @override
      int compareByColumn(Sortable other, int columnIndex) {
         if (other is! RoleFunctionData) {
          throw ArgumentError('Comparando Funcion Rol con un tipo diferente');
        }

        switch(columnIndex) {
          case 0:
            return id.compareTo(other.id);
          case 1:
            return code.compareTo(other.code);
          case 2:
            return description.compareTo(other.description);
          case 4:
            return roleCategoryName.compareTo(other.roleCategoryName);
          default:
            return 0;
        }
      }
}
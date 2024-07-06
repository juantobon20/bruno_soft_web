import '../../../data/data.dart';
import '../../domain.dart';
import '../../../presentation/widgets/widgets.dart';

extension MapperUser on UserResponse {

  UserData mapper() => UserData(
    id: id,
    roleId: roleId,
    neighborhoodId: neighborhoodId,
    identification: identification.formatNit(),
    firstName: firstName.toTitleCase(),
    lastName: lastName.toTitleCase(),
    phone: phone.formatPhone(),
    email: email,
    state: state
  );
}
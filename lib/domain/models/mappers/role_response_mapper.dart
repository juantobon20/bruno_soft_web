import '../../../data/data.dart';
import '../../domain.dart';

extension RoleMapper on RoleResponse {

  RoleData mapper() => RoleData(
    id: id, 
    name: name,
    state: state
  );
}

extension RoleFunctionMapper on RoleFunctionResponse {

  RoleFunctionData mapper() => RoleFunctionData(
    id: id, 
    roleCategoryId: roleCategoryId, 
    roleCategoryName: roleCategoryName,
    code: code, 
    description: description
  );
}

extension RoleCategoryMapper on RoleCategoryResponse {

  RoleCategoryData mapper() => RoleCategoryData(
    id: id, 
    name: name, 
    state: state
  );
}
import 'dart:convert';

import '../../configs/config.dart';
import '../../domain/domain.dart';
import '../data.dart';

class AuthDatasourceImpl implements AuthDatasource {

  final DioProvider _dioProvider;
  final KeyValueStorageService _keyValueStorageService;
  
  AuthDatasourceImpl({
    required DioProvider dioProvider,
    required KeyValueStorageService keyValueStorageService
  }) : _dioProvider = dioProvider,
    _keyValueStorageService = keyValueStorageService;
  
  @override
  Future<AuthResponse> login({required AuthRequest authRequest}) async {
    final dataRequest = authRequest.toJson();
    final loginResponse = await _dioProvider.post("Auth/Login", dataRequest);

    return AuthResponse.fromJson(loginResponse);
  }

  @override
  Future insert({required AuthData authData}) async {
    await _keyValueStorageService.setKeyValue(Constants.tokenKey, authData.token);
    await _keyValueStorageService.setKeyValue(Constants.tokenExpirationKey, authData.tokenExpiration.toIso8601String());
    await _keyValueStorageService.setKeyValue(Constants.userAuthKey, jsonEncode(authData.user.toJson()));
  }
  
  @override
  Future<bool> isLoggedIn() async {
    final token = await _keyValueStorageService.getValue(Constants.tokenKey);
    return token != null && token.isNotEmpty;
  }
}
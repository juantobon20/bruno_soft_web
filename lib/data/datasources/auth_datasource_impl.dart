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
  Future<void> logout() async {
    await _keyValueStorageService.removeAll();
  }

  @override
  Future insert({required AuthData authData}) async {
    await _keyValueStorageService.setKeyValue(Constants.tokenKey, authData.token);
    await _keyValueStorageService.setKeyValue(Constants.tokenExpirationKey, authData.tokenExpiration.toIso8601String());
    await _keyValueStorageService.setKeyValue(Constants.userAuthKey, jsonEncode(authData.user.toJson()));

    _dioProvider.setToken(authData.token);
  }
  
  @override
  Future<bool> isLoggedIn() async {
    final token = await _keyValueStorageService.getValue(Constants.tokenKey);
    if (token == null || token.trim().isEmpty) {
      return false;
    }

    final tokenExpirationString = await _keyValueStorageService.getValue(Constants.tokenExpirationKey);
    if (tokenExpirationString == null || tokenExpirationString.isEmpty) {
      return false;
    }

    final tokenExpiration = DateTime.parse(tokenExpirationString);
    if (tokenExpiration.isBefore(DateTime.now())) {
      logout();
      return false;
    }

    _dioProvider.setToken(token);
    return true;
  }
}
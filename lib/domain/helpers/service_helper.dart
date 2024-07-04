import '../domain.dart';

class ServiceHelper {
  
  static Future<void> handleServiceCall<T>({
    required Future<T> Function() serviceCall,
    required Function(ErrorData errorData) returnException
  }) async {
    try {
      await serviceCall();
    } on NetworkException {
      returnException(ErrorData(type: ErrorType.noInternet));
    } on ApiFailureException catch (e) {
      returnException(
        ErrorData(
          type: ErrorType.otherError,
          title: 'Error code: ${e.statusCode}',
          message: '${e.message}'
        )
      );
    } on UnknownFailureException {
      returnException(
        ErrorData(
          type: ErrorType.otherError,
          title: 'Error no encontrado',
          message: 'Ups algo falló por favor intenta mas tarde'
        )
      );
    } on BadRequestException catch (e) {
      returnException(
        ErrorData(
          type: ErrorType.otherError,
          message: e.message,
          title: e.title
        )
      );
    }
  }
}
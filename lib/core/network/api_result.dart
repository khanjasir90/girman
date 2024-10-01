abstract class ApiResult<T> {
  T? data;
  String? errorMessage;

  ApiResult({this.data, this.errorMessage,});
}

class ApiSuccess<T> extends ApiResult<T> {
  ApiSuccess({required T data}) : super(data: data);
}

class ApiError<T> extends ApiResult<T> {
  ApiError({required String errorMessage}) : super(errorMessage: errorMessage);
}
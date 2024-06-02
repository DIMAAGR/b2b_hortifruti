class ResponseData<T> {
  final T? data;
  final String? error;

  ResponseData.success(this.data) : error = null;
  ResponseData.failure(this.error) : data = null;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}

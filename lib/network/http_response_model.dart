class HTTPResponse<T> {
  bool isSuccessFul = false;
  T? data;
  String? message;
  int? responseCode;

  HTTPResponse(this.isSuccessFul, this.data, {this.message, this.responseCode});
}
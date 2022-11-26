enum Status {
  Completed,
  Error,
}

class Result<T> {
  Status status;
  T? data;
  String? message;
  List<String>? errorCodes;

  Result.completed(this.data, [this.message]) : status = Status.Completed;

  Result.error(this.message, {this.errorCodes}) : status = Status.Error;

  @override
  String toString() {
    return '$status $message $data';
  }
}

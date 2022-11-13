class Result<T> {
  Status status;
  T? data;
  String? message;
  List<String>? errorCodes;

  Result.completed(this.data, [this.message]) : status = Status.completed;

  Result.error(this.message, {this.errorCodes}) : status = Status.error;

  @override
  String toString() {
    return '$status $message $data';
  }
}

enum Status { completed, error }

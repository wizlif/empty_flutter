class Resource<T> {
  Status status;
  T? data;
  String? message;

  Resource.success(T data)
      : status = Status.SUCCESS,
        this.data = data;

  Resource.error(String message)
      : status = Status.ERROR,
        this.message = message;

  Resource.loading() : status = Status.LOADING;

  Resource.empty() : status = Status.EMPTY;
}

enum Status { EMPTY, LOADING, SUCCESS, ERROR }

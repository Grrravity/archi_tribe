class ValueFailure<T> {
  final T message;
  final T? details;

  ValueFailure({required this.message, this.details});

  @override
  String toString() => 'message: $message, detail: $details';
}

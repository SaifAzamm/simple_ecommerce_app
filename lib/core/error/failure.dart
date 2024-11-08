abstract class Failure {
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is ServerFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return message!; // Provide a meaningful string representation
  }
}

class NoDataFailure extends Failure {
  @override
  bool operator ==(Object other) => other is NoDataFailure;

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'NoDataFailure: No data available.'; // Provide a meaningful string representation
  }
}

class CacheFailure extends Failure {
  @override
  bool operator ==(Object other) => other is CacheFailure;

  @override
  int get hashCode => 0;

  @override
  String toString() {
    return 'CacheFailure: Failed to access cache.'; // Provide a meaningful string representation
  }
}

class ImagePickerFailure extends Failure {
  final String? message;

  const ImagePickerFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is ImagePickerFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'ImagePickerFailure: $message'; // Provide a meaningful string representation
  }
}

class FilePickerFailure extends Failure {
  final String? message;

  const FilePickerFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is FilePickerFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'FilePickerFailure: $message'; // Provide a meaningful string representation
  }
}

class DatePickerFailure extends Failure {
  final String? message;

  const DatePickerFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is DatePickerFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'DatePickerFailure: $message'; // Provide a meaningful string representation
  }
}

class LocationFailure extends Failure {
  final String? message;

  const LocationFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is LocationFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'LocationFailure: $message'; // Provide a meaningful string representation
  }
}

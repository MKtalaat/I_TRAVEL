
abstract class Failure {
  final String error;

  const Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromFireBaseException(String exception) {
    switch (exception) {
      case 'invalid-credential':
        return ServerFailure('Incorrect email or password!');
      case 'invalid-email':
        return ServerFailure('Invalid email!');
      case 'email-already-in-use':
        return ServerFailure('Email is already in use!');
      case 'network-request-failed':
        return ServerFailure('Check your internet connection and try again!');
      default:
        return ServerFailure('Sorry, an error occurred, please try again!');
    }
  }

}

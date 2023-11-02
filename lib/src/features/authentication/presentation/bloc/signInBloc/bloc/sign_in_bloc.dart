import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_stars/src/features/authentication/data/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;
  SignInBloc(this.userRepository) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

   // User email validation logic
  final _emailController = BehaviorSubject<String>();
  Stream<String> get emailStream => _emailController.stream;

  void updateEmail(
    String email,
  ) {
    if (email.isEmpty) {
      _emailController.sink.addError("Email is required");
      return;
    }
    // Check user email is valid or not using regex pattern matching logic here
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      _emailController.sink.addError("Email is not valid");
      return;
    }
    _emailController.add(email);
    return;
  }

  // User password validation logic
  final _passwordController = BehaviorSubject<String>();
  Stream<String> get passwordStream => _passwordController.stream;

  void updatePassword(
    String password,
  ) {
    if (password.isEmpty) {
      _passwordController.sink.addError("Password is required");
      return;
    }
    // Check user password is valid or not using regex pattern matching logic here
    if (!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        .hasMatch(password)) {
      _passwordController.sink.addError(
          "At least 8 characters, including UPPER/lowercase and numbers");
      return;
    }
    _passwordController.add(password);
    return;
  }


  // Sign In Button validation logic
  Stream<bool> get signInButtonStream =>
      Rx.combineLatest2(emailStream, passwordStream, (email, password) {
        if (email.isNotEmpty && password.isNotEmpty) {
          return true;
        }
        return false;
      });
}

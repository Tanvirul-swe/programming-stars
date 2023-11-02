import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_stars/src/features/authentication/data/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  SignUpBloc(this.userRepository) : super(SignUpInitialState()) {
    on<SignUpEvent>((event, emit) {
      if (event is SignUpRequest) {
        emit(SignUpLoadingState());
        userRepository
            .signUp(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          password: event.password,
          confirmPassword: event.confirmPassword,
        )
            .then((value) {
          emit(SignUpSuccessState());
        }).catchError((error) {
          emit(SignUpErrorState(errorMessage: error.toString()));
        });
      }
    });
  }

// User First Name validation logic
  final _firstNameController = BehaviorSubject<String>();
  Stream<String> get firstNameStream => _firstNameController.stream;

  void updateName(
    String firstName,
  ) {
    if (firstName.isEmpty) {
      _firstNameController.sink.addError("First Name is required");
      return;
    }
    _firstNameController.add(firstName);
    return;
  }

  // User last name validation logic
  final _lastNameController = BehaviorSubject<String>();
  Stream<String> get lastNameStream => _lastNameController.stream;

  void updateLastName(
    String lastName,
  ) {
    if (lastName.isEmpty) {
      _lastNameController.sink.addError("Last Name is required");
      return;
    }
    _lastNameController.add(lastName);
    return;
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

  // User Confirm password validation logic
  final _confirmPasswordController = BehaviorSubject<String>();
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;

  void updateConfirmPassword(String confirmPass) {
    if (confirmPass.isEmpty) {
      _confirmPasswordController.sink.addError("Confirm Password is required");
      return;
    }
    // Check user confirm password is valid or not using regex pattern matching logic here
    if (!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        .hasMatch(confirmPass)) {
      _confirmPasswordController.sink.addError(
          "At least 8 characters, including UPPER/lowercase and numbers");
      return;
    }
    _confirmPasswordController.add(confirmPass);
    return;
  }

  // Sigin Up button validation logic here
  Stream<bool> get signUpValid => Rx.combineLatest5(
        firstNameStream,
        lastNameStream,
        emailStream,
        passwordStream,
        confirmPasswordStream,
        (firstName, lastName, email, password, confirmPassword) =>
            firstName.isNotEmpty &&
            lastName.isNotEmpty &&
            email.isNotEmpty &&
            password.isNotEmpty &&
            confirmPassword.isNotEmpty,
      );
}

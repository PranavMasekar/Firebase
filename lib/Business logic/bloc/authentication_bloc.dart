import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:many_apps/Business%20logic/bloc/authentication_event.dart';

import '../../Data/Repository/user_repository.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  late User currentUser;
  AuthenticationBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(Unauthenticated()) {
    on<AppStarted>((event, emit) => _checkUserLog(event, emit));
    on<LogIn>((event, emit) => _logIn(event, emit));
    on<LogOut>((event, emit) => _logOut(event, emit));
  }

  AuthenticationState get initialState => Uninitialized();

  Future<void> _logIn(LogIn event, Emitter<AuthenticationState> emit) async {
    try {
      User? currentUser = await _userRepository.signInWithGoogle();
      if (currentUser == null)
        emit(Unauthenticated());
      else
        emit(Authenticated(currentUser: currentUser));
    } catch (e) {
      emit(Unauthenticated());
      print(e.toString());
    }
  }

  Future<void> _logOut(LogOut event, Emitter<AuthenticationState> emit) async {
    emit(Unauthenticated());
    _userRepository.signOut();
  }

  Future<void> _checkUserLog(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        currentUser = (await _userRepository.getUser())!;
        emit(Authenticated(currentUser: currentUser));
      } else {
        emit(Unauthenticated());
      }
    } catch (_) {
      emit(Unauthenticated());
    }
  }

  // Stream<AuthenticationState> mapEventToState(
  //   AuthenticationEvent event,
  // ) async* {
  //   if (event is AppStarted) {
  //     yield* _mapAppStartedToState();
  //   } else if (event is LogIn) {
  //     yield* _mapLoggedInToState();
  //   } else if (event is LogOut) {
  //     yield* _mapLoggedOutToState();
  //   }
  // }

  // Stream<AuthenticationState> _mapAppStartedToState() async* {
  //   try {
  //     final isSignedIn = await _userRepository.isSignedIn();
  //     if (isSignedIn) {
  //       currentUser = (await _userRepository.getUser())!;
  //       yield Authenticated(currentUser.displayName!);
  //     } else {
  //       yield Unauthenticated();
  //     }
  //   } catch (_) {
  //     yield Unauthenticated();
  //   }
  // }

  // Stream<AuthenticationState> _mapLoggedInToState() async* {
  //   currentUser = (await _userRepository.getUser())!;
  //   yield Authenticated(currentUser.displayName!);
  // }

  // Stream<AuthenticationState> _mapLoggedOutToState() async* {
  //   yield Unauthenticated();
  //   _userRepository.signOut();
  // }
}

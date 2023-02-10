import 'dart:async';

abstract class FirebaseConfigRepository {
  FutureOr<dynamic> getDashBoard();

  FutureOr<dynamic> getAllGame();

  FutureOr<dynamic> getHotGame();
}
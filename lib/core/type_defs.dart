import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/failure.dart';

import '../features/auth/models/user_model.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;

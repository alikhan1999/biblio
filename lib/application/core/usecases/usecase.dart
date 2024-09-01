import 'package:biblio_bazar/application/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params prams);
}

abstract class UseCased<Type, Params> {
  Future<Either<Failure, Type>> call(Params prams, String educationId);
}

abstract class HomePageUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params prams, int perPage, int pageNoString);
}

abstract class FourParameterUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params prams, String years, String occurrence, String userId, int month);
}

abstract class HomePageStatusUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params prams, String appointmentId, String status);
}

abstract class HomePageListUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params prams, int perPage, int pageNoString);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params prams);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:random_qoutes/core/errors/failures.dart';


// template for any usecase
abstract class UseCase<Type,Paramters> {
  Future<Either<Failure,Type>> call(Paramters params);
}

abstract class NoParamters extends Equatable{
  @override
  List<Object> get props => [];
}

class NoParams extends NoParamters{
  
}
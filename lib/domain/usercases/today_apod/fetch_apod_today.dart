import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:astronomy_picture/domain/usercases/core/usercase.dart';
import 'package:dartz/dartz.dart';

class FetchApodToday extends UserCase<Apod, NoParamenter> {
  final TodayApodRepository repository;


  FetchApodToday({required this.repository});


  @override
  Future<Either<Failure, Apod>> call(NoParamenter parameter) async {
    return await repository.fetchApodToday();
  }
}

import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
// import 'package:astronomy_picture/domain/usercases/today_apod/fetch_apod_today.dart';
import 'package:dartz/dartz.dart';

abstract class TodayApodRepository {
  /// Retrun a Apod date on Righ side of Either case is a success, otherwise
  /// Return a Failure on Left side odf Either
  Future<Either<Failure , Apod>> fetchApodToday();
}

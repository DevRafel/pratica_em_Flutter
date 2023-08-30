import 'package:astronomy_picture/core/failure.dart';
import 'package:astronomy_picture/domain/entities/apod.dart';
import 'package:astronomy_picture/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:astronomy_picture/domain/usercases/core/usercase.dart';
import 'package:astronomy_picture/domain/usercases/today_apod/fetch_apod_today.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'fatch_apod_today_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodRepository>()])
void main() {
  late MockTodayApodRepository repository;
  late FetchApodToday usecase;

  setUp(() {
    repository = MockTodayApodRepository();
    usecase = FetchApodToday(repository: repository);
  });

  /// Retorna apod

  test("Deve retornar um entidade Apod no lado direiro do Either", () async {
    //cenario
    when(repository.fetchApodToday())
        .thenAnswer((_) async => Right<Failure, Apod>(tApod()));
    //ação
    final result = await usecase(NoParamenter());
    // esperado
    expect(result, Right<Failure, Apod>(tApod()));
  });

  /// Retorna falha

  test("Deve retornar um Failure no lado esquerdo do Either", () async {
    //cenario
    when(repository.fetchApodToday())
        .thenAnswer((_) async => Left<Failure, Apod>(tNoConnection()));
    //ação
    final result = await usecase(NoParamenter());
    // esperado
    expect(result, Left<Failure, Apod>(tNoConnection()));
  });
}

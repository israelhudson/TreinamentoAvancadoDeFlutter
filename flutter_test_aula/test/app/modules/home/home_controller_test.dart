import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_aula/app/modules/home/home_controller.dart';
import 'package:flutter_test_aula/app/modules/home/tools/json_user_mock.dart';
import 'package:flutter_test_aula/app/shared/data/user_service.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements Client {}

void main() {
  late ClientMock client;
  late UserService service;
  late HomeController controller;

  setUp(() {
    client = ClientMock();
    service = UserService(client: client);
    controller = HomeController(service: service);
  });

  group('Serviço de Usuario', () {
    test("Deve pegar uma lista de User Mock e retornar 200", () async {
      when(client)
          .calls(#get)
          .thenAnswer((_) async => Response(jsonUserMock, 200));

      final list = await service.getUsers();
      expect(list.isNotEmpty, equals(true));
    });

    test("Deve pegar uma lista de User Mock e retornar erro", () async {
      when(client)
          .calls(#get)
          .thenAnswer((_) async => Response(jsonUserMock, 404));

      expect(
          () async => await service.getUsers(), throwsA(isA<UserEmptyList>()));
    });
  });

  group('Contadores', () {
    test('Deve incrementar o contador', () {
      controller.increment();
      controller.increment();
      expect(controller.counter, 2);
    });
  });
}

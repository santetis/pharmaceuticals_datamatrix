import 'package:pharmaceutical_datamatrix/pharmaceutical_datamatrix.dart';
import 'package:test/test.dart';

void main() {
  test('too short', () {
    expect(
      () => PharmaceuticalCip13.fromString('123123'),
      throwsA(isArgumentError),
    );
  });

  test('invalid prefix', () {
    expect(
      () => PharmaceuticalCip13.fromString('4200935510259'),
      throwsA(isArgumentError),
    );
  });

  test('invalid type', () {
    expect(
      () => PharmaceuticalCip13.fromString('3402935510259'),
      throwsA(isArgumentError),
    );
  });

  test('invalid classification', () {
    expect(
      () => PharmaceuticalCip13.fromString('3400f35510259'),
      throwsA(isArgumentError),
    );
  });

  test('invalid crc', () {
    expect(
      () => PharmaceuticalCip13.fromString('3400935510255'),
      throwsA(isArgumentError),
    );
  });

  test('valid', () {
    final cip13 = PharmaceuticalCip13.fromString('3400935510259');
    expect(cip13.cip7.toString(), '3551025');
  });
}
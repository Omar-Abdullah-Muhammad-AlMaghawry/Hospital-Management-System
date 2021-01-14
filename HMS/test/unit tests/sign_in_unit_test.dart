import 'package:HMS/screens/authenticate/sign_in.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit tests for the sign in page validator:', () {
    test('Empty email returns error', () {
      var res = Validation.emailValidator('');
      expect(res, 'Enter an Email');
    });
    test('Short password returns error', () {
      var res = Validation.passwordValidator('12345');
      expect(res, 'Enter +6 chars password');
    });

    test('Valid email returns null', () {
      var res = Validation.emailValidator('test@test.test');
      expect(res, null);
    });

    test('Good password returns null', () {
      var res = Validation.passwordValidator('123456789');
      expect(res, null);
    });
  });
}

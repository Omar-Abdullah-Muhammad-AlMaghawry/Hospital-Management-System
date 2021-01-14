import 'package:HMS/screens/authenticate/register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit test for the registration page validator:', () {
    test('email', () {
      //failure cases
      var result1 = Validation.emailValidator('');
      expect(result1, 'Enter an Email');
      var result2 = Validation.emailValidator('email@test.com');
      expect(result2, "Please Enter Valid Email");
      //success case
      var result3 = Validation.emailValidator('email@dorporf.com');
      expect(result3, null);
    });

    test('username', () {
      var result = Validation.userNameValidator('');
      expect(result, 'Enter User Name');
    });

    test('password', () {
      var result = Validation.passwordValidator('1234');
      expect(result, 'Enter +6 chars password');
    });
    test('phone number', () {
      var result = Validation.phonenumberValidator('');
      expect(result, 'Enter a Phone Number');
    });
    test('address', () {
      var result = Validation.addressValidator('');
      expect(result, 'Enter your address');
    });
  });
}

import 'package:aisat_store_app/global_variable.dart';
import 'package:aisat_store_app/models/user.dart';
import 'package:aisat_store_app/services/manage_http_response.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<void> signUpUsers(
      {required context,
      required String email,
      required String fullName,
      required String password}) async {
    try {
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          state: '',
          city: '',
          locality: '',
          password: password);
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            //Set the Headers for the request
            "Content-Type":
                'application/json; charset=UTF-8' // specifiy the context type as Json
          }); // Convert the user Ob  ject to Json for the request body

      manageHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account has been created.');
          });
    } catch (e) {
      print(e);
    }
  }
}

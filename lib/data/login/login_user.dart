
class LoginUser {
  
  String userId;
  String name;
  String email;
  String phone;
  String token;

  LoginUser({this.userId, this.name, this.email, this.phone, this.token});
  
  factory LoginUser.fromJson(Map<String, dynamic> responseData) {
    return LoginUser(
      userId: responseData['userId'],
      name: responseData['name'],
      email: responseData['email'],
      phone: responseData['phone'],
      token: responseData['token']
    );
  }
}
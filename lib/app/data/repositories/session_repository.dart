import 'package:gym_app/app/data/model/customer.dart';
import 'package:gym_app/app/data/model/user.dart';

class SessionRepository {
  SessionRepository._privateConstructor();

  static final SessionRepository _instance = SessionRepository._privateConstructor();

  static SessionRepository get instance => _instance;

  String _accessToken;
  Customer _customer;
  User _user;

  Customer get customer => _customer;
  User get user => _user;

  void setUser(User user) {
    _user = user;
  }

  void setCustomer(Customer customer) {
    _customer = customer;
  }

  String get accessToken => _accessToken;
  void setAccessToken(String accessToken) => _accessToken = accessToken;

}
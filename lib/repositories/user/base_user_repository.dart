import '../../models/models.dart';

abstract class BaseUserRepository {
  Stream<User> getUser(String id);
}

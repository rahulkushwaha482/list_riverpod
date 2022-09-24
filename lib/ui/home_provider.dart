import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';

class HomeProvider extends StateNotifier<AsyncValue<UserModel>> {
  HomeProvider(super.state);
}
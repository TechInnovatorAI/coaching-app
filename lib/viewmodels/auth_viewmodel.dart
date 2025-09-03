import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_up_na/data/models/user_model.dart';
import 'package:rank_up_na/data/repositories/auth_repository.dart';

// Provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// Auth ViewModel using StateNotifier
class AuthViewModel extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository) : super(const AsyncValue.data(null));

  /// Register
  Future<void> register({
    required String email,
    required String password,
    required String username,
    required String fullName,
  }) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.register(
        email: email,
        password: password,
        username: username,
        fullName: fullName,
      );
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow; // Re-throw to handle in UI
    }
  }

  /// Login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authRepository.login(
        email: email,
        password: password,
      );
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow; // Re-throw to handle in UI
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await _authRepository.logout();
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }
}

// Provider for AuthViewModel
final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AsyncValue<UserModel?>>((ref) {
  return AuthViewModel(ref.watch(authRepositoryProvider));
});
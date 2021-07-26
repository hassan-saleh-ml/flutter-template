import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_presenter.freezed.dart';

part 'profile_state.dart';

class ProfilePresenter extends Cubit<ProfileState> {

  final ProfileService profileService;

  ProfilePresenter({
    required this.profileService,
    @visibleForTesting ProfileState? state
  }): super(state ?? ProfileState.initial());

  void load() async {
    emit(state.copyWith(isLoading: true));
    var profileName = await profileService.getProfileName() ?? "";
    emit(state.copyWith(isLoading: false, name: profileName));
  }
}

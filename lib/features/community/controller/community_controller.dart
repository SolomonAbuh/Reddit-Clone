import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reddit_clone/core/constants/constants.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/features/community/repository/community_repository.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/utils.dart';
import '../../../models/community_model.dart';

final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  return CommunityController(
      communityRepository: ref.read(communityRepositoryProvider)!, ref: ref);
});

class CommunityController extends StateNotifier<bool> {
  final Ref _ref;
  final CommunityRepository _communityRepository;
  CommunityController(
      {required CommunityRepository communityRepository, required Ref ref})
      : _communityRepository = communityRepository,
        _ref = ref,
        super(false);

  void createCommunity(
      {required String name, required BuildContext context}) async {
    state = true;
    final uid = _ref.read(userProvider)?.uid ?? '';

    Community community = Community(
      id: name,
      name: name,
      banner: Constants.bannerDefault,
      avater: Constants.avatarDefault,
      members: [uid],
      mods: [uid],
    );

    final res = await _communityRepository.createCommunity(community);
    state = false;

    res.fold(
      (l) => showSnackBar(context: context, text: l.message),
      (r) {
        showSnackBar(context: context, text: 'Community Created succesfully');
        Routemaster.of(context).pop();
      },
    );
  }

  Stream<List<Community>> getUsersCommunities() {
    final uid = _ref.read(userProvider)?.uid ?? '';
    return _communityRepository.getUsersCommunities(uid: uid);
  }
}

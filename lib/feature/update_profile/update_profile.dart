import 'package:event_app/feature/update_profile/viewmodel/update_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../core/colors/app_colors.dart';
import '../../core/models/user_model.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({Key? key}) : super(key: key);
  final UpdateProfileVM _updateProfileVM = UpdateProfileVM();

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: context.paddingMedium,
        children: [
          context.emptySizedHeightBoxHigh,
          Center(
            child: Observer(
              builder: (a) => Stack(
                children: [
                  _updateProfileVM.imageUrl != ""
                      ? CircleAvatar(
                          radius: context.height * 0.09,
                          backgroundColor: AppColors.transparent,
                          backgroundImage:
                              NetworkImage(_updateProfileVM.imageUrl!))
                      : CircleAvatar(
                          radius: context.height * 0.09,
                          backgroundColor: AppColors.transparent,
                          backgroundImage: user.profileImageUrl != ""
                              ? NetworkImage(user.profileImageUrl)
                              : const AssetImage("assets/image.png")
                                  as ImageProvider,
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () => _updateProfileVM.setProfileImage(),
                      icon: Icon(
                        Icons.change_circle,
                        color: AppColors.white,
                        size: context.height * 0.05,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          TextField(
            onChanged: (value) => _updateProfileVM.onNameChanged(value),
            style: context.textTheme.bodyText2?.copyWith(
              fontSize: context.height * 0.025,
            ),
            decoration: InputDecoration(
              hintText: user.name,
              hintStyle: context.textTheme.bodyText2?.copyWith(
                fontSize: context.height * 0.025,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
              ),
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          TextField(
            onChanged: (value) => _updateProfileVM.onUsernameChanged(value),
            style: context.textTheme.bodyText2?.copyWith(
              fontSize: context.height * 0.025,
            ),
            decoration: InputDecoration(
              hintText: user.userName,
              hintStyle: context.textTheme.bodyText2?.copyWith(
                fontSize: context.height * 0.025,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
              ),
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          TextField(
            onChanged: (value) => _updateProfileVM.onPhoneNumberChanged(value),
            decoration: InputDecoration(
              hintText: _updateProfileVM.phoneNumber == ""
                  ? user.phoneNumber
                  : _updateProfileVM.phoneNumber,
              hintStyle: context.textTheme.bodyText2?.copyWith(
                fontSize: context.height * 0.025,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
              ),
            ),
          ),
          context.emptySizedHeightBoxLow3x,
          Observer(builder: (_) {
            return TextField(
              readOnly: true,
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                  height: context.height * 0.3,
                  color: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.height * 0.3,
                        child: CupertinoTheme(
                          data: const CupertinoThemeData(
                            brightness: Brightness.dark,
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (val) {
                              _updateProfileVM.onDateChanged(val);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              decoration: InputDecoration(
                hintText: _updateProfileVM.birthDate == null
                    ? DateFormat("dd MMM yyyy").format(user.birthDate)
                    : DateFormat("dd MMMM yyyy")
                        .format(_updateProfileVM.birthDate!),
                hintStyle: context.textTheme.bodyText2?.copyWith(
                  fontSize: context.height * 0.025,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), //<-- SEE HERE
                ),
              ),
            );
          }),
          context.emptySizedHeightBoxLow3x,
          TextButton(
            onPressed: () {
              _updateProfileVM.updateProfile(
                _updateProfileVM.name == "" ? user.name : _updateProfileVM.name,
                _updateProfileVM.username == ""
                    ? user.userName
                    : _updateProfileVM.username,
                _updateProfileVM.birthDate == null
                    ? user.birthDate
                    : _updateProfileVM.birthDate!,
                _updateProfileVM.phoneNumber == ""
                    ? user.phoneNumber
                    : _updateProfileVM.phoneNumber,
              );
            },
            child: Text(
              "Kaydet",
              style: context.textTheme.bodyText2?.copyWith(
                fontSize: context.height * 0.025,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

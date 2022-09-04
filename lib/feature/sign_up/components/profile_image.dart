import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/app_colors.dart';
import '../viewmodel/sign_up_viewmodel.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required SignUpVM signUpViewmodel,
  })  : _signUpViewmodel = signUpViewmodel,
        super(key: key);

  final SignUpVM _signUpViewmodel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (a) => Stack(
        children: [
          CircleAvatar(
            radius: 100.r,
            backgroundColor: AppColors.transparent,
            backgroundImage: _signUpViewmodel.imageFile != null
                ? FileImage(_signUpViewmodel.imageFile!)
                : const AssetImage("assets/image.png") as ImageProvider,
          ),
          Visibility(
            visible: _signUpViewmodel.imageFile != null,
            child: Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () => _signUpViewmodel.setProfileImage(),
                icon: Icon(
                  Icons.change_circle,
                  color: AppColors.white,
                  size: 30.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

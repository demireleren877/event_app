import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

import '../viewmodel/main_viewmodel.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required MainVM mainVM,
  })  : _mainVM = mainVM,
        super(key: key);

  final MainVM _mainVM;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        context.emptySizedWidthBoxLow3x,
        SizedBox(
          width: context.width * 0.75,
          child: TextField(
            onChanged: (value) => _mainVM.chageSearchValue(value),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                iconSize: 30.sp,
                color: Colors.white54,
                onPressed: () {},
              ),
              filled: true,
              fillColor: Colors.grey.shade900,
              hintText: "Find Amazing Parties",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: context.normalBorderRadius,
              ),
            ),
          ),
        ),
        context.emptySizedWidthBoxLow3x,
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on_outlined),
          iconSize: context.height * 0.05,
          color: Colors.pink.shade600,
        )
      ],
    );
  }
}

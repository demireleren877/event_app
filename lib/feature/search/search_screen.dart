import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            context.emptySizedHeightBoxNormal,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: context.width * 0.7,
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30.sp,
                      ),
                      hintText: "Arama yap",
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      contentPadding: context.paddingLow,
                      filled: true,
                      fillColor: const Color(0xFFACA0DF),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(context.normalValue),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "İptal",
                    style: context.textTheme.bodyText2?.copyWith(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                )
              ],
            ),
            context.emptySizedHeightBoxLow3x,
            TabBar(
              padding: context.paddingNormal,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.amber,
              indicator: BoxDecoration(
                borderRadius: context.lowBorderRadius,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              unselectedLabelStyle:
                  context.textTheme.headline6?.copyWith(fontSize: 18.sp),
              labelStyle:
                  context.textTheme.headline6?.copyWith(fontSize: 18.sp),
              tabs: const [
                Tab(
                  text: "Kişiler",
                ),
                Tab(
                  text: "Mekanlar",
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.75,
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.black,
                  ),
                  Container(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

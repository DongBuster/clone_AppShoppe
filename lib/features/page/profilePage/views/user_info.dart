import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_shoppe/features/page/profilePage/view_models/profile_page_view_model.dart';
import 'package:clone_shoppe/features/page/profilePage/views/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProfilePageViewModel viewModel =
        Provider.of<ProfilePageViewModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //--- avatar ----
        const Gap(12),
        Stack(
          children: [
            StreamBuilder<String>(
              stream: viewModel.getImageUrlStream(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  return ClipOval(
                    child: CachedNetworkImage(
                      width: 70,
                      height: 70,
                      imageUrl: snapshot.data!,
                      errorWidget: (context, url, error) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/img/user_default.jpg',
                            width: 70,
                            height: 70,
                          ),
                        );
                      },
                      placeholderFadeInDuration: const Duration(seconds: 1),
                    ),
                  ); // Hiển thị ảnh từ đường dẫn
                }
                return const SizedBox();
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const ChangePictureAvatar(),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  width: 22,
                  height: 22,
                  child: const Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),

        //-- user name ---
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: viewModel.getNameUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Unknown user');
                }
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data! == '' ? 'Unknown user' : snapshot.data!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ); // Hiển thị ảnh từ đường dẫn
                }
                return const SizedBox();
              },
            ),
            const Gap(5),
            Container(
              width: 95,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(4),
                  Text(
                    'Thành viên bạc',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(3),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: Colors.black54,
                  )
                ],
              ),
            ),
            const Gap(5),
            Row(
              children: [
                RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(text: 'Người theo dõi'),
                        TextSpan(
                          text: ' 0',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  width: 1,
                  height: 10,
                  color: Colors.black38,
                ),
                RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(text: 'Đang theo dõi'),
                        TextSpan(
                          text: ' 8',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

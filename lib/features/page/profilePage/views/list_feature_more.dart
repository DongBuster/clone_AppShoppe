import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/global_variables.dart';
import '../../../auth/services/auth.dart';
import '../../introductoinPage/view_models/introduction_page_view_model.dart';
import '../resources/widgets/feature_link.dart';

class ListFeatureProfilePage extends StatelessWidget {
  const ListFeatureProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            // onTap: () async {
            //   await LoadData.loadStringFromAsset(
            //       'lib/database/dataProductsRecommend.json');
            // },
            child: const FeatureLink(
                icon: Icons.workspace_premium,
                colorIcon: Colors.green,
                title: 'Khách hàng thân thiết',
                description: 'Thành viên Bạc',
                isBorderBottom: true,
                isBorderTop: false),
          ),
          const FeatureLink(
              icon: Icons.live_tv,
              colorIcon: Colors.yellow,
              title: 'Shoppe Live',
              description: '',
              isBorderBottom: true,
              isBorderTop: false),
          const FeatureLink(
              icon: Icons.favorite_border,
              colorIcon: GloblalVariable.hex_f94f2f,
              title: 'Đã thích',
              description: '',
              isBorderBottom: true,
              isBorderTop: false),
          FeatureLink(
              icon: Icons.add_business,
              colorIcon: Colors.yellow.shade500,
              title: 'Shop đang theo dõi',
              description: '',
              isBorderBottom: true,
              isBorderTop: false),
          const FeatureLink(
              icon: Icons.card_giftcard,
              colorIcon: Colors.indigo,
              title: 'Săn thưởng Shoppe',
              description: 'Lấy ngay 1,000 xu',
              isBorderBottom: true,
              isBorderTop: false),
          FeatureLink(
              icon: Icons.history,
              colorIcon: Colors.indigo.shade300,
              title: 'Đã xem gần đây',
              description: '',
              isBorderBottom: true,
              isBorderTop: false),
          const FeatureLink(
              icon: Icons.account_balance_wallet,
              colorIcon: GloblalVariable.hex_f94f2f,
              title: 'Số dư tài khoản',
              description: '',
              isBorderBottom: true,
              isBorderTop: false),
          const FeatureLink(
              icon: Icons.star,
              colorIcon: Colors.green,
              title: 'Đánh giá của tôi',
              description: '',
              isBorderBottom: false,
              isBorderTop: false),
          GestureDetector(
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();

                await Auth.signOut().then((value) {
                  context.goNamed(GloblalVariable.loginScreen);
                  prefs.setBool('islogin', false);
                  prefs.setString('email', '');
                  Provider.of<IntroductionPageViewModel>(context, listen: false)
                      .setImageFile(null);
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              },
              child: const FeatureLink(
                icon: Icons.logout_rounded,
                colorIcon: Colors.redAccent,
                title: 'Logout',
                description: '',
                isBorderBottom: false,
                isBorderTop: true,
              )),
        ],
      ),
    );
  }
}

final snackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Warning!',
    message: 'Something error occurred, please try again !',
    contentType: ContentType.warning,
  ),
);

import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/image/cache_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fani_wedding/src/features/account/view/about_us_view.dart';
import 'package:fani_wedding/src/features/account/view/update_profile_view.dart';
import 'package:fani_wedding/src/features/auth/view/sign_in_view.dart';
import 'package:fani_wedding/src/theme/colors.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: Constants.kPaddingL),
            decoration: const BoxDecoration(
              color: XAppColors.primary,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Constants.kPaddingL),
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: XCacheNetworkImage(
                          imageUrl:
                              'https://www.denkapratama.co.id/img/default-placeholder.f065b10c.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: Constants.kPaddingL),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(height: Constants.kPaddingS),
                        Text(
                          'Nomor telepon',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: Constants.kPaddingXS),
                        Text(
                          'Email',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Constants.kPaddingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => UpdateProfileView(),
                      ),
                    );
                  },
                  child: Text(
                    'Edit Profil',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Divider(thickness: 2),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => AboutUsView(),
                      ),
                    );
                  },
                  child: Text(
                    'Tentang Kami',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Divider(thickness: 2),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => SignInView(),
                      ),
                    );
                  },
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Divider(thickness: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
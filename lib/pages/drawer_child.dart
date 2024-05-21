import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_project/pages/account_settings_page.dart';
import 'package:db_project/pages/login_page.dart';
import 'package:flutter/material.dart';

class DrawerChild extends StatelessWidget {
  const DrawerChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: CachedNetworkImage(
            imageUrl:
                "https://galeri.netfotograf.com/images/medium/69433C4D690F8A66.jpg",
            fit: BoxFit.cover,
          ),
        ),
        drawerButton(
            context: context,
            text: "Account Settings",
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AccountSettingsPage(),
              ));
            },
            icon: const Icon(Icons.manage_accounts_rounded)),
        drawerButton(
            context: context,
            text: "Log out",
            onClick: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            })
      ],
    );
  }

  Widget drawerButton(
      {required BuildContext context,
      required String text,
      required void Function() onClick,
      Icon? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.black38,
          child: InkWell(
            onTap: onClick,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) icon,
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

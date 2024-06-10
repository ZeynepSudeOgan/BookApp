import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_project/models/user.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:db_project/utils/providers/user_provider.dart';
import 'package:db_project/widgets/editable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

/*Image.network(
                  "https://galeri.netfotograf.com/images/medium/69433C4D690F8A66.jpg",
                  fit: BoxFit.cover,),*/
class _AccountSettingsPageState extends State<AccountSettingsPage> {
  UserProvider? userProvider;
  User? user;
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    user = userProvider!.user;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //ortaya aldım ama isterseniz başta dursun
        title: const Text("Account Settings"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await onSaveClicked();
        },
        child: const Icon(Icons.save),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: user?.imageLink ??
                                "https://galeri.netfotograf.com/images/medium/69433C4D690F8A66.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    EditableTextField(
                      variableName: "Username",
                      initialText: user?.username ?? "null",
                      onEdit: (text) {
                        user?.username = text;
                      },
                    ),
                    EditableTextField(
                      variableName: "Name",
                      initialText: user?.name ?? "null",
                      onEdit: (text) {
                        user?.name = text;
                      },
                    ),
                    EditableTextField(
                      variableName: "Surname",
                      initialText: user?.surname ?? "null",
                      onEdit: (text) {
                        user?.surname = text;
                      },
                    ),
                    EditableTextField(
                      variableName: "Password",
                      initialText: user?.password ?? "null",
                      obscureText: true,
                      onEdit: (text) {
                        user?.password = text;
                      },
                    ),
                    EditableTextField(
                      variableName: "Image",
                      initialText: user?.imageLink ?? "null",
                      onEdit: (text) {
                        user?.imageLink = text;
                      },
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onSaveClicked() async {
    if (user != null) {
      userProvider!.setUser(user!);
      await DataManager.updateUser(userProvider!.user!);
    }
  }
}

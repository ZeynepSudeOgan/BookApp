import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

/*Image.network(
                  "https://galeri.netfotograf.com/images/medium/69433C4D690F8A66.jpg",
                  fit: BoxFit.cover,),*/
class _AccountSettingsPageState extends State<AccountSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings"),
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
                          child: Image.network(
                            "https://galeri.netfotograf.com/images/medium/69433C4D690F8A66.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "User Name",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      "User email",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

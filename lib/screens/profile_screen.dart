import 'package:flutter/material.dart';
import 'package:fooderlich/models/fooderlich_pages.dart';
import 'package:fooderlich/models/profile_manager.dart';
import 'package:provider/provider.dart';
import 'package:fooderlich/components/circle_image.dart';
import 'package:fooderlich/models/user.dart';

class ProfileScreen extends StatefulWidget {
  static MaterialPage page(User user) {
    return MaterialPage(
        child: ProfileScreen(user: user),
        name: FooderlichPages.profilePath,
        key: ValueKey(FooderlichPages.profilePath));
  }

  final User user;
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Provider.of<ProfileManager>(context, listen: false)
                  .tapOnProfile(false);
            },
            icon: const Icon(Icons.close)),
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 16.0),
          buildProfile(),
          Expanded(child: buildMenu())
        ]),
      ),
    );
  }

  Widget buildDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text('Dark Mode'),
          Switch(
              value: widget.user.darkMode,
              onChanged: (value) {
                Provider.of<ProfileManager>(context, listen: false).darkMode =
                    value;
              })
        ],
      ),
    );
  }

  Widget buildMenu() {
    return ListView(
      children: [
        buildDarkModeRow(),
        ListTile(
          title: const Text('View raywenderlich.com'),
          onTap: () {
            // TODO: Open raywenderlich.com webview
          },
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            // TODO: Logout user
          },
        )
      ],
    );
  }

  Widget buildProfile() {
    return Column(
      children: [
        CircleImage(
          imageProvider: AssetImage(widget.user.profileImageUrl),
          imageRadius: 60.0,
        ),
        const SizedBox(height: 16.0),
        Text(widget.user.firstName, style: const TextStyle(fontSize: 21)),
        Text(widget.user.role),
        Text('${widget.user.points} points',
            style: const TextStyle(fontSize: 30, color: Colors.green))
      ],
    );
  }
}

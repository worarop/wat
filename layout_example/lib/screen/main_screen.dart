import 'package:flutter/material.dart';
import 'package:layout_example/page.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  void onIndexChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(
            //   currentAccountPicture: CircleAvatar(
            //     backgroundImage: NetworkImage(
            //         "https://sgp1.digitaloceanspaces.com/adaybulletin/2018/05/feature_feature_535_%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B8%88%E0%B8%A3%E0%B8%88%E0%B8%B1%E0%B8%94.jpg"),
            //   ),
            //   accountName: Text("Worarop Kanokwiwat"),
            //   accountEmail: Text("61223245@cmru.ac.th"),
            // ),
            DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn.galaxy.tf/unit-media/tc-default/uploads/images/poi_photo/001/553/511/wat-phra-sigh-standard.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://sgp1.digitaloceanspaces.com/adaybulletin/2018/05/feature_feature_535_%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B8%88%E0%B8%A3%E0%B8%88%E0%B8%B1%E0%B8%94.jpg"),
                    ),
                    Text("วัดพระสิงห์"),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/history');
              },
              leading: Icon(Icons.account_balance_rounded),
              title: Text("ประวัติ"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/credit');
              },
              leading: Icon(Icons.add_location_alt),
              title: Text("เครดิต"),
            ),
            ListTile(
              leading: Icon(Icons.backup_rounded),
              title: Text("รูปภาพวัด"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(pages[currentIndex].title),
      ),
      body: pages[currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onIndexChanged,
        items: pages
            .map(
              (page) => BottomNavigationBarItem(
                icon: page.icon,
                label: page.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

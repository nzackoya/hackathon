import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/network/cient_view.dart';
import 'package:init/screens/contractors/contractors.dart';
import 'package:init/screens/login/login_page.dart';
import 'package:init/screens/login/login_view.dart';
import 'package:init/screens/profile/profile.dart';
import 'package:init/screens/profile/profile_view.dart' hide Profile;
import 'package:init/screens/projects/projects.dart';
import 'package:init/util/extension.dart';
import 'package:init/util/hive_helper.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {

  int _currentIndex = 0;

  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(hiveHelperProvider);
    final token = ref.watch(loginProviderProvider);
    final user = ref.watch(profileProviderProvider).value;
    return token.handle(
        data: (data) {
          if (data == null) {
            _currentIndex = 0;
            return const LoginPage();
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    _currentIndex = index;
                    _pageController?.animateToPage(index, duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
                    setState(() {});
                  },
                  backgroundColor: Colors.white,
                  selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  items: [
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.paste_rounded), label: 'Мои проекты'),
                    if (user?.type == 'organisation') const BottomNavigationBarItem(
                        icon: Icon(Icons.contact_mail_outlined), label: 'Подрядчики'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline), label: 'Профиль'),
                  ],
                ),
              body: PageView(
                controller: _pageController,
                  children: [
                    const Projects(),
                    if (user?.type == 'organisation') const Contractors(),
                    const Profile()
                  ]),
            );
          }
        }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_shop_app/app_styles.dart';
import 'package:pet_shop_app/size_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kBackground,
          items: [
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? SvgPicture.asset("assets/home_selected.svg")
                  : SvgPicture.asset("assets/home_unselected.svg"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? SvgPicture.asset("assets/cart_selected.svg")
                  : SvgPicture.asset("assets/cart_unselected.svg"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? SvgPicture.asset("assets/profile_selected.svg")
                  : SvgPicture.asset("assets/profile_unselected.svg"),
              label: "",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<String> dogs = [
      "dog_marly.png",
      "dog_cocoa.png",
      "dog_walt.png",
      "dog_marly.png",
      "dog_cocoa.png",
      "dog_walt.png",
    ];

    List<String> nameDogs = [
      "Marly",
      "Cocoa",
      "Walt",
      "Marly",
      "Cocoa",
      "Walt",
    ];

    List<String> cats = [
      "cat_alyx.png",
      "cat_brook.png",
      "cat_marly.png",
      "cat_alyx.png",
      "cat_brook.png",
      "cat_marly.png",
    ];

    List<String> nameCats = [
      "Alyx",
      "Brook",
      "Marly",
      "Alyx",
      "Brook",
      "Marly",
    ];

    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/nav_icon.svg",
                    width: 20,
                  ),
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kRed,
                  backgroundImage: AssetImage(
                    "assets/images/avatar_profile.png",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/welcome_message.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: SizeConfig.blockSizeHorizontal! * 38,
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello Babu",
                            style: kSourceSansProSemiBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 5,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            "👋",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Ready for an amazing and lucky experience 😻😽",
                        style: kSourceSansProRegular.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Row(
                children: [
                  Text(
                    "Dogs",
                    style: kSourceSansProBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 6,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    "🐕",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 169,
            child: ListView.builder(
              itemCount: dogs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Container(
                  height: 169,
                  width: 150,
                  margin: EdgeInsets.only(
                    left: index == 0 ? 30 : 16,
                    right: index == 10 - 1 ? 30 : 0,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCardBorderRadiusList),
                    color: kWhite,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 14,
                        offset: const Offset(0, 3),
                        color: kBoxShadow.withOpacity(0.18),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(kCardBorderRadiusList),
                          child: Image.asset(
                            "assets/images/${dogs[index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: SizeConfig.blockSizeVertical! * 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.5),
                              color: kLightOrange,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Center(
                              child: Text(
                                "BANANA",
                                style: kSourceSansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.5,
                                ),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.favorite_outline,
                            color: kRed,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text(
                            nameDogs[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kSourceSansProBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            "22 Nov 2022",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kSourceSansProRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 2,
                              color: kLightGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Row(
                children: [
                  Text(
                    "Cats",
                    style: kSourceSansProBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 6,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    "🐈",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 169,
            child: ListView.builder(
              itemCount: cats.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Container(
                  height: 169,
                  width: 150,
                  margin: EdgeInsets.only(
                    left: index == 0 ? 30 : 16,
                    right: index == 10 - 1 ? 30 : 0,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCardBorderRadiusList),
                    color: kWhite,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 14,
                        offset: const Offset(0, 3),
                        color: kBoxShadow.withOpacity(0.18),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(kCardBorderRadiusList),
                          child: Image.asset(
                            "assets/images/${cats[index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: SizeConfig.blockSizeVertical! * 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.5),
                              color: kLightOrange,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Center(
                              child: Text(
                                "GOLDEN",
                                style: kSourceSansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 2.5,
                                ),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.favorite_outline,
                            color: kRed,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text(
                            nameCats[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kSourceSansProBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            "22 Nov 2022",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kSourceSansProRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 2,
                              color: kLightGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

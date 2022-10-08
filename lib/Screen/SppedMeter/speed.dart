import 'package:flutter/material.dart';

class SpeedMeter extends StatefulWidget {
  const SpeedMeter({Key? key}) : super(key: key);
  static const routeName = '/SpeedMeter';

  @override
  State<SpeedMeter> createState() => _SpeedMeterState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _SpeedMeterState extends State<SpeedMeter> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Text(
                  "Tabbar with out Appbar",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.blue,
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.green,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              // indicatorSize: TabBarIndicatorSize.label,
              onTap: (int val) {
                setState(() {
                  print('_tabController : ${_tabController.index}//${val}');
                });
              },
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  insets: _tabController.index == 0
                      ? EdgeInsets.only(right: 70.0)
                      : _tabController.index == 1
                          ? EdgeInsets.symmetric(horizontal: 30)
                          : EdgeInsets.only(left: 70.0)),
              padding: EdgeInsets.zero,
              tabs: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Tab(
                    text: '1st tab',
                  ),
                ),
                Tab(
                  text: '2 nd tab',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Tab(
                    text: '3 nd tab',
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(child: Center(child: Text('1 people'))),
                  Container(child: Center(child: Text('2 people'))),
                  Container(child: Center(child: Text('3 people'))),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterpro/calls.dart';
import 'package:flutterpro/camera.dart';
import 'package:flutterpro/chats.dart';
import 'package:flutterpro/status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal, accentColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          actions: const [
            Icon(Icons.camera_alt),
            SizedBox(
              width: 16,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 16,
            ),
            Icon(Icons.more_vert),
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(icon: Icon(Icons.camera)),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            Camera(),
            Chats(),
            Status(),
            Calls(),
          ],
        ),
        floatingActionButton: tabController.index == 0
            ? FloatingActionButton(
                child: const Icon(Icons.camera),
                onPressed: () {},
              )
            : tabController.index == 1
                ? FloatingActionButton(
                    child: const Icon(Icons.chat),
                    onPressed: () {},
                  )
                : tabController.index == 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            SizedBox(
                              height: 45,
                              width: 45,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white70,
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.blueGrey,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            FloatingActionButton(
                                child: const Icon(Icons.camera_alt),
                                onPressed: () {})
                          ])
                    : FloatingActionButton(
                        child: const Icon(Icons.call), onPressed: () {}),
      ),
    );
  }
}

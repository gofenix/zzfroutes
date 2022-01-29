import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zzfroutes/widgets/another.dart';
import 'eventbus.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        child: MyHomePage(title: 'Flutter Demo Home Page'),
        length: 2,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bus.on("_velocity", (arg) {
      print(arg);
      print("---------------");
      setState(() {
        _counter = 9999999;
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: TabBar(
          tabs: [
            Tab(child: Text("基础")),
            Tab(child: Text("其他")),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Column(
                  // Column is also a layout widget. It takes a list of children and
                  // arranges them vertically. By default, it sizes itself to fit its
                  // children horizontally, and tries to be as tall as its parent.
                  //
                  // Invoke "debug painting" (press "p" in the console, choose the
                  // "Toggle Debug Paint" action from the Flutter Inspector in Android
                  // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                  // to see the wireframe for each widget.
                  //
                  // Column has various properties to control how it sizes itself and
                  // how it positions its children. Here we use mainAxisAlignment to
                  // center the children vertically; the main axis here is the vertical
                  // axis because Columns are vertical (the cross axis would be
                  // horizontal).
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    // antoher
                    TextButton(
                      child: const Text("打开Text路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewTextRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Button路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewButtonRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Image路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewImageRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Switch路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewSwitchRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Form路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewFormRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Scaffold路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewScaffoldRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开ListView路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewListViewRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开ScrollNotification路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewScrollNotificationRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开GridView路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewGridRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开PageView路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewPageRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开TabBarView路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewTabBarRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开WillPopScope路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewPopScopeRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Theme路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewThemeRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Dialog路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewDialogRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开手势路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewGestureRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开File操作路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewFileRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Http路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewHttpRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开Dio路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewDioRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开DioFutureBuilder路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewDioFutureBuilderRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开url launcher路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewURLRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开V2EX路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewV2exRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开照相机路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewPictureRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开地理位置路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewGeoRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开设备信息路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewDeviceRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开电池路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewBatteryRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开手势路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewGestureRoute();
                        }));
                      },
                    ),
                    TextButton(
                      child: const Text("打开手势路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewGestureRoute();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: const Text("打开图片卡片路由"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NewImageCardRoute();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewTextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("新路由"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "hahah",
              textAlign: TextAlign.left,
            ),
            Text(
              "hello world, I am jack" * 100,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              "Hello world",
              textScaleFactor: 2,
            )
          ],
        ),
      ),
    );
  }
}

class NewButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("button演示")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () => {}, child: const Text("normal")),
            TextButton(onPressed: () {}, child: const Text("hello world")),
            IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text("发送"))
          ],
        ),
      ),
    );
  }
}

class NewImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image演示")),
      body: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage("images/podcast.jpeg"),
              width: 100.0,
            ),
            Image.asset(
              "images/avatar.jpeg",
              width: 100.0,
            ),
            const Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
            ),
            Image.network(
              "https://n.sinaimg.cn/tech/transform/308/w140h168/20220128/1ff1-937906687cb6dffd34511151258efb8c.gif",
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}

class NewSwitchRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewSwitchRouteState();
  }
}

class NewSwitchRouteState extends State<NewSwitchRoute> {
  bool _switchSelected = true;
  bool _checkBoxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Switch Checkbox演示"),
        ),
        body: Column(
          children: [
            Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                }),
            Checkbox(
                value: _checkBoxSelected,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    _checkBoxSelected = value!;
                  });
                })
          ],
        ));
  }
}

class NewFormRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewFormRouteState();
  }
}

class NewFormRouteState extends State<NewFormRoute> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("表单演示"),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: (value) {
              print("用户onchange $value");
            },
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.password),
            ),
            obscureText: true,
          ),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: const InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: const InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v!.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("登录"),
                        ),
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            //验证通过提交数据
                            print(_unameController.text);
                            print("验证通过: ");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Scaffold(
                                appBar: AppBar(
                                  title: const Text("login ok"),
                                ),
                                body: Column(
                                  children: [
                                    Text(_unameController.value.text),
                                    Text(_pwdController.value.text),
                                    LinearProgressIndicator(
                                      backgroundColor: Colors.grey[200],
                                      valueColor: const AlwaysStoppedAnimation(
                                          Colors.blue),
                                    ),
                                    LinearProgressIndicator(
                                      backgroundColor: Colors.grey[200],
                                      valueColor: const AlwaysStoppedAnimation(
                                          Colors.blue),
                                      value: .5,
                                    )
                                  ],
                                ),
                              );
                            }));
                          }
                        },
                      ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NewScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewScaffoldRouteState();
  }
}

class NewScaffoldRouteState extends State<NewScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name APP"),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ));
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: const [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "家庭"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "商务"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "学校"),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                          child: Image.asset(
                        "images/podlink.png",
                        width: 100.0,
                      )),
                    ),
                    const Text(
                      "Fenix",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("添加账号"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("管理账号"),
                  )
                ],
              ))
            ],
          )),
    );
  }
}

class NewListViewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewListViewRouteState();
  }
}

class NewListViewRouteState extends State<NewListViewRoute> {
  static const loadingTag = "##加载中##";
  final _words = [loadingTag];

  @override
  void initState() {
    super.initState();
    _retriveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表演示"),
      ),
      body: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retriveData();

              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: .0,
          );
        },
      ),
    );
  }

  void _retriveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}

class NewScrollNotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewScrollNotificationRouteState();
  }
}

class NewScrollNotificationRouteState
    extends State<NewScrollNotificationRoute> {
  var _progress = "0%";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动监听演示"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            var progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;

            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                    );
                  }),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewGridRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewGridRouteState();
  }
}

class NewGridRouteState extends State<NewGridRoute> {
  final _icons = [];

  @override
  void initState() {
    super.initState();
    _retriveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("网格演示"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.0),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            if (index == _icons.length - 1 && _icons.length < 200) {
              _retriveData();
            }
            return Icon(_icons[index]);
          }),
    );
  }

  void _retriveData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _icons.addAll([
        Icons.ac_unit,
        Icons.airport_shuttle,
        Icons.all_inclusive,
        Icons.beach_access,
        Icons.cake,
        Icons.free_breakfast,
      ]);
    });
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<StatefulWidget> createState() {
    return PageState();
  }
}

class PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(
      child: Text(
        widget.text,
        textScaleFactor: 5,
      ),
    );
  }
}

class NewPageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    for (int i = 0; i < 10; i++) {
      children.add(Page(text: "this page is $i"));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("PageView演示"),
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: children,
        ));
  }
}

class NewTabBarRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewTabBarRouteState();
  }
}

class NewTabBarRouteState extends State<NewTabBarRoute>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Name TabBar View"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class NewPopScopeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewPopScopeRouteState();
  }
}

class NewPopScopeRouteState extends State<NewPopScopeRoute> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("导航返回拦截"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt!) >
                  const Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: const Text("1秒内连续按两次返回键退出"),
        ),
      ),
    );
  }
}

class NewThemeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewThemeRouteState();
  }
}

class NewThemeRouteState extends State<NewThemeRoute> {
  var _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var themeData = Theme.of(context);

    return Theme(
        data: ThemeData(
            primarySwatch: _themeColor,
            iconTheme: IconThemeData(color: _themeColor)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("主题换色"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("  颜色跟随主题")
                ],
              ),
              Theme(
                data: themeData.copyWith(
                  iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text("  颜色固定黑色")
                    ]),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal;
              });
            },
            child: const Icon(Icons.palette),
          ),
        ));
  }
}

class NewDialogRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("对话框"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("提示"),
                        content: const Text("你确定要。。。？"),
                        actions: [
                          TextButton(
                            child: const Text("取消"),
                            onPressed: () =>
                                Navigator.of(context).pop(), // 关闭对话框
                          ),
                          TextButton(
                            child: const Text("删除"),
                            onPressed: () {
                              //关闭对话框并返回true
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: const Text("打开"))
        ],
      ),
    );
  }
}

class NewGestureRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewGestureRouteState();
  }
}

class NewGestureRouteState extends State<NewGestureRoute> {
  var _operation = "no gesture detected";

  double _top = 100;
  double _left = 100;

  var homeCounter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("手势识别demo"),
      ),
      body: Stack(children: [
        Positioned(
          top: 200,
          left: 100,
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200,
              height: 100,
              child: Text(
                _operation,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              setState(() {
                _operation = "单击";
              });
            },
            onDoubleTap: () {
              setState(() {
                _operation = "双击";
              });
            },
            onLongPress: () {
              setState(() {
                _operation = "长按";
              });
            },
          ),
        ),
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("$homeCounter"),
            ),
            onPanDown: (e) {
              print("用户手指按下: ${e.globalPosition}");
            },
            onPanUpdate: (e) {
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (e) {
              print(e.velocity);
              bus.emit("_velocity", e.velocity);
            },
          ),
        ),
      ]),
    );
  }
}

class NewFileRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewFileRouteState();
  }
}

class NewFileRouteState extends State<NewFileRoute> {
  int _counter = 0;

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    _readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  _incrementCounter() async {
    setState(() {
      _counter++;
    });

    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("file演示demo"),
      ),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewHttpRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewHttpRouteState();
  }
}

class NewHttpRouteState extends State<NewHttpRoute> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP演示"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _loading = true;
                    _text = "正在请求中";
                  });

                  try {
                    //创建一个HttpClient
                    HttpClient httpClient = HttpClient();
                    //打开Http连接
                    HttpClientRequest request = await httpClient
                        .getUrl(Uri.parse("https://www.baidu.com"));
                    //使用iPhone的UA
                    request.headers.add(
                      "user-agent",
                      "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
                    );
                    //等待连接服务器（会将请求信息发送给服务器）
                    HttpClientResponse response = await request.close();
                    //读取响应内容
                    _text = await response.transform(utf8.decoder).join();
                    //输出响应头
                    print(response.headers);

                    //关闭client后，通过该client发起的所有请求都会中止。
                    httpClient.close();
                  } catch (e) {
                    print(e);
                    _text = "请求失败";
                  } finally {
                    setState(() {
                      _loading = false;
                    });
                  }
                },
                child: const Text("获取baidu首页Html")),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(_text.replaceAll(RegExp(r"\s"), "")),
            )
          ],
        ),
      ),
    );
  }
}

class NewDioRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewDioRouteState();
  }
}

class NewDioRouteState extends State<NewDioRoute> {
  bool _loading = false;
  String _text = "";

  final _dio = Dio();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP演示"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _loading = true;
                    _text = "正在请求中";
                  });

                  try {
                    var res = await _dio
                        .get("https://api.github.com/orgs/flutterchina/repos");
                    await Future.delayed(const Duration(seconds: 2));
                    _text = res.data.toString();
                  } catch (e) {
                    print(e);
                    _text = "请求失败";
                  } finally {
                    setState(() {
                      _loading = false;
                    });
                  }
                },
                child: const Text("获取Github数据")),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(_text.replaceAll(RegExp(r"\s"), "")),
            )
          ],
        ),
      ),
    );
  }
}

class NewDioFutureBuilderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewDioFutureBuilderRouteState();
  }
}

class NewDioFutureBuilderRouteState extends State<NewDioFutureBuilderRoute> {
  final _dio = Dio();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("github repos"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: _getGithubData(),
          builder: (context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return ListView(
                children: response.data
                    .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
                    .toList(),
              );
            } else {
              //请求未完成时弹出loading
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<Response> _getGithubData() async {
    await Future.delayed(const Duration(seconds: 3));
    return _dio.get("https://api.github.com/orgs/flutterchina/repos");
  }
}

class NewURLRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewURLRouteState();
  }
}

class NewURLRouteState extends State<NewURLRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("打开url"),
      ),
      body: ListView(
        children: [
          TextButton(
              onPressed: () async {
                await launch("https://www.baidu.com");
              },
              child: const Text("打开baidu")),
          TextButton(
              onPressed: () async {
                await launch("https://www.google.com");
              },
              child: const Text("打开google"))
        ],
      ),
    );
  }
}

class NewV2exRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewV2exRouteState();
  }
}

class NewV2exRouteState extends State<NewV2exRoute>
    with SingleTickerProviderStateMixin {
  final _dio = Dio();
  late TabController _tabController;

  @override
  void initState() {
    setState(() {
      _tabController = TabController(length: 2, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("V2EX"),
        bottom: TabBar(
          controller: _tabController,
          tabs: ["CNode", "V2EX"].map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            alignment: Alignment.center,
            child: FutureBuilder(
              future: () async {
                return _dio.get("https://cnodejs.org/api/v1/topics");
              }(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Response resp = snapshot.data;
                  //发生错误
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }

                  return ListView(
                    children: resp.data["data"].map<Widget>((e) {
                      return TextButton(
                          onPressed: () {
                            var url = "https://cnodejs.org/topic/${e["id"]}";
                            launch(url);
                          },
                          child: Text(e["title"]));
                    }).toList(),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: FutureBuilder(
              future: () async {
                return _dio.get("https://www.v2ex.com/api/topics/latest.json");
              }(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Response resp = snapshot.data;
                  //发生错误
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }

                  return ListView(
                    children: resp.data.map<Widget>((e) {
                      return TextButton(
                          onPressed: () {
                            var url = e["url"];
                            launch(url);
                          },
                          child: Text(e["title"]));
                    }).toList(),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class NewPictureRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewPictureRouteState();
  }
}

class NewPictureRouteState extends State<NewPictureRoute> {
  AssetEntity? entity;
  Uint8List? data;

  Future<void> pick(BuildContext context) async {
    final Size size = MediaQuery.of(context).size;
    final double scale = MediaQuery.of(context).devicePixelRatio;
    try {
      final AssetEntity? _entity = await CameraPicker.pickFromCamera(
        context,
        enableRecording: true,
      );
      if (_entity != null && entity != _entity) {
        entity = _entity;
        if (mounted) {
          setState(() {});
        }
        data = await _entity.thumbDataWithSize(
          (size.width * scale).toInt(),
          (size.height * scale).toInt(),
        );
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("摄像演示demo"),
      ),
      body: Stack(
        children: <Widget>[
          if (entity != null && data != null)
            Positioned.fill(child: Image.memory(data!, fit: BoxFit.contain))
          else if (entity != null && data == null)
            const Center(child: CircularProgressIndicator())
          else
            const Center(child: Text('Click the button to start picking.')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pick(context);
        },
        tooltip: "拍照",
        child: const Icon(Icons.camera),
      ),
    );
  }
}

class NewGeoRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewGeoRouteState();
  }
}

class NewGeoRouteState extends State<NewGeoRoute> {
  String _pos = "";

  Future<Position> _determinLocation() async {
    await Future.delayed(const Duration(seconds: 1));

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("location services are disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    _determinLocation().then((value) {
      setState(() {
        _pos = value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("地理位置演示"),
      ),
      body: Center(
        child: Column(
          children: [
            () {
              if (_pos == "") {
                return const CircularProgressIndicator();
              } else {
                return Text("当前位置是：$_pos");
              }
            }(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _pos = "";
          });
          var local = await _determinLocation();
          setState(() {
            _pos = local.toString();
          });
        },
        child: const Icon(Icons.location_city),
      ),
    );
  }
}

class NewDeviceRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewDeviceRouteState();
  }
}

class NewDeviceRouteState extends State<NewDeviceRoute> {
  final _deviceInfo = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    if (kIsWeb) {
      deviceData = _readWebBrowserInfo(await _deviceInfo.webBrowserInfo);
    } else {
      if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await _deviceInfo.iosInfo);
      }
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("设备信息演示"),
      ),
      body: ListView(
        children: _deviceData.keys.map(
          (String property) {
            return Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    property,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    '${_deviceData[property]}',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}

class NewBatteryRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewBatteryRouteState();
  }
}

class NewBatteryRouteState extends State<NewBatteryRoute> {
  final battery = Battery();
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  String _state = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _batteryStateSubscription;
    _batteryStateSubscription =
        battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _state = state.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("电池demo"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final level = await battery.batteryLevel;

                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Text("当前电量：$level"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          )
                        ],
                      );
                    });
              },
              child: Text("当前电量"),
            ),
            Text("当前电池模式：$_state"),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _batteryStateSubscription?.cancel();
  }
}

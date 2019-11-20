import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/model.dart';
import 'home.dart';
import 'index_page.dart';
import 'index_provider.dart';
/**
 * Provider 获取数据状态有两种方式：
  1.使用 Provider.of<T>(context)
  2.使用 Consumer
  不过这两种方式都需要在顶层套上 ChangeNotifierProvider():
 */
void main() => runApp(

        // 使用Provider全局配置
        MultiProvider(
      providers: [
        // 两种方式，这里使用ChangeNotifierProvider，因为可以自动调用dispose()方法，帮我释放资源
        ChangeNotifierProvider(builder: (_) => IndexProvider()),
        // ChangeNotifierProvider.value(value: IndexProvider()),
        
        // 改变主题颜色
        ChangeNotifierProvider<DataInfo>.value(value: DataInfo(),child: MyApp(),),
        
        /// 计数
        ChangeNotifierProvider<Counter>.value(
          value: Counter(1),
          child: MyApp(),
        )
      ],
      child: MyApp(),
      // child: MyApp1(),
    ));

// 数字增加
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DataInfo dataInfo = Provider.of<DataInfo>(context);
    return MaterialApp(
      title: 'Provider Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: dataInfo.changeTheme(),
      home: HomePage(),
    );
  }
}


// 页面的切换
class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}



// 创建共享数据类
class DataInfo with ChangeNotifier {
  int _count = 0;

  ThemeData _dataTheme = ThemeData.dark();

  get dataTheme => this._dataTheme;

  get count => this._count;

  addCount() {
    this._count++;
    notifyListeners();
  }

  subCount() {
    this._count--;
    notifyListeners();
  }

  changeTheme() {
    if (this._dataTheme == ThemeData.light()) {
      this._dataTheme = ThemeData.dark();
    } else {
      this._dataTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
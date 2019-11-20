import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'index_provider.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    
    // 使用 Consumer访问数据
    return Consumer<IndexProvider>(
        //优化：在状态改变时viewpage子页面不会走build方法
        child: PageView(
          physics: NeverScrollableScrollPhysics(), //禁止滚动
          //获取pageController后不监听改变
          controller: Provider.of<IndexProvider>(context,listen: false).pageController,
          children: [ChildPage("第一页"), ChildPage("第二页"), ChildPage("第三页")],
        ),
        builder: (context, indexProvider, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  indexProvider.index = index;
                },
                currentIndex: indexProvider.index,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.android), title: Text("android")),
                  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
                  BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("person")),
                ]),
            floatingActionButton: FloatingActionButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
            }),
          );
        });
  }
}

class ChildPage extends StatefulWidget {
  final String title;

  ChildPage(this.title);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("${widget.title}: initState");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("${widget.title}: build");
    return Scaffold(
      backgroundColor: widget.title == '第一页'
          ? Colors.red.withOpacity(0.5)
          : widget.title == '第二页'
          ? Colors.yellow.withOpacity(0.5)
          : Colors.green.withOpacity(0.5),
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text(widget.title)),
    );
  }
}




class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: () => changePageIndex(context, 0), child: Text("切换1"), color: Colors.red),
            FlatButton(onPressed: () => changePageIndex(context, 1), child: Text("切换2"), color: Colors.yellow),
            FlatButton(onPressed: () => changePageIndex(context, 2), child: Text("切换3"), color: Colors.green),
          ],
        ),
      ),
    );
  }

  changePageIndex(context, int index) {
    // 点击事件
    Provider.of<IndexProvider>(context, listen: false).index = index;
  }
}
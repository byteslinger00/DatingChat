import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_dating_app/widgets/chat_listing_content.dart';
import 'package:flutter_chat_dating_app/widgets/custom_app_bar.dart';
import 'package:flutter_chat_dating_app/widgets/friends_list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Date Chat',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				brightness: Brightness.dark,
				primarySwatch: Colors.blue,
				fontFamily: 'RobotoMono',
			),
			home: MyHomePage(title: 'Flutter Demo Home Page'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);
	final String title;
	
	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	
	ScrollController scrollController = new ScrollController();
	
	List<String> lChatItems = ["Harry","Timothy","Frankine","Ronald","Sarah","2","Third","4"];
	
	@override
	void initState() {
		super.initState();
		SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
			statusBarColor: Colors.transparent,
			statusBarIconBrightness: Brightness.dark,
		));
	}
	
	@override
	void dispose() {
		super.dispose();
		scrollController.dispose();
	}
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Stack(
				children: <Widget>[
					CustomAppBar(),
					Positioned.fill(
						child: Padding(
							padding: EdgeInsets.only(top: 60.0 + 40.0),
							child: Column(
								mainAxisSize: MainAxisSize.max,
								children: <Widget>[
									Padding(
										padding: EdgeInsets.all(16.0),
										child: Container(
											height: MediaQuery.of(context).size.height * 0.16,
											child: ListView.builder(
												primary: false,
												shrinkWrap: true,
												scrollDirection: Axis.horizontal,
												itemCount: lChatItems == null ? 0 : lChatItems.length,
												controller: scrollController,
												itemBuilder: (BuildContext context, int index){
													return FriendsListItem(lChatItem: lChatItems[index],);
												},
											),
										),
									),
									Expanded(
										child: ChatListingContent(),
									),
								],
							),
						),
					),
				],
			),
		);
	}
}

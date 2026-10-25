import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false, home:Mi9nFull()));

class Mi9nFull extends StatefulWidget{ @override State<Mi9nFull> createState()=>_S(); }
class _S extends State<Mi9nFull> with SingleTickerProviderStateMixin{
 late TabController tab; bool zero=true;
 @override void initState(){ super.initState(); tab=TabController(length:3, vsync:this); }
 final chats=[
 {"n":"Sbu Kasi 🔵","m":"Bhuti logo yi-fire 🪶","t":"08:11","u":3},
 {"n":"Kasi Group","m":"Mi9n LIVE eDurban!","t":"07:58","u":9},
 {"n":"Thando","m":"0 Data Mode ON","t":"07:42","u":1},
 {"n":"Ma Blue","m":"Welcome to Mi9n","t":"Yesterday","u":0},
 ];
 @override Widget build(BuildContext c){
 return Scaffold(
 appBar: AppBar(backgroundColor: Color(0xFF0D47A1), title: Row(children:[Icon(Icons.chat_bubble,color:Colors.white),SizedBox(width:8),Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text("Mi9n 🪶",style:TextStyle(fontWeight:FontWeight.bold)),Text(zero?"0 Data ON":"Full Mode",style:TextStyle(fontSize:10,color:Colors.white70))])]), actions:[IconButton(icon:Icon(zero?Icons.data_saver_on:Icons.wifi),onPressed:()=>setState(()=>zero=!zero))], bottom: TabBar(controller:tab,tabs:[Tab(text:"CHATS"),Tab(text:"STATUS"),Tab(text:"CALLS")])),
 body: TabBarView(controller:tab,children:[
 ListView.builder(itemCount:chats.length,itemBuilder:(co,i){final ch=chats[i];return ListTile(leading:CircleAvatar(backgroundColor:Color(0xFF0D47A1),child:Text(ch["n"]![0])),title:Text(ch["n"]!),subtitle:Text(ch["m"]!),trailing:ch["u"]>0?CircleAvatar(radius:10,backgroundColor:Color(0xFF0D47A1),child:Text("${ch["u"]}",style:TextStyle(fontSize:10,color:Colors.white))):Text(ch["t"]!),onTap:()=>Navigator.push(co,MaterialPageRoute(builder:(_)=>ChatP(name:ch["n"]!,zero:zero))));}),
 Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Icon(Icons.chat_bubble,size:80,color:Color(0xFF0D47A1)),Text("Mi9n Blue Feather 🪶",style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:Color(0xFF0D47A1))) ])),
 Center(child:Text("Calls coming soon"))
 ]),
 floatingActionButton: FloatingActionButton(backgroundColor:Color(0xFF0D47A1),child:Icon(Icons.chat,color:Colors.white),onPressed:(){}),
 );
 }
}

class ChatP extends StatefulWidget{ final String name; final bool zero; ChatP({required this.name,required this.zero}); @override State<ChatP> createState()=>_CP(); }
class _CP extends State<ChatP>{
 final ctrl=TextEditingController(); List msgs=[{"me":false,"t":"Yo bhut! Logo yi-fire! 🪶"},{"me":true,"t":"Sharp bhut! Mi9n live! 🇿🇦"}];
 @override Widget build(BuildContext c)=>Scaffold(
 appBar: AppBar(backgroundColor:Color(0xFF0D47A1),foregroundColor:Colors.white,title:Text(widget.name)),
 body: Column(children:[
 if(widget.zero)Container(color:Colors.amber[100],padding:EdgeInsets.all(8),child:Text("0 Data Mode ON",style:TextStyle(fontSize:11))),
 Expanded(child:ListView.builder(itemCount:msgs.length,padding:EdgeInsets.all(12),itemBuilder:(co,i){final m=msgs[i];final me=m["me"];return Align(alignment:me?Alignment.centerRight:Alignment.centerLeft,child:Container(margin:EdgeInsets.symmetric(vertical:4),padding:EdgeInsets.all(12),decoration:BoxDecoration(color:me?Color(0xFFDCF8C6):Colors.white,borderRadius:BorderRadius.circular(12)),child:Text(m["t"])));})),
 Padding(padding:EdgeInsets.all(8),child:Row(children:[Expanded(child:TextField(controller:ctrl,decoration:InputDecoration(hintText:"Bhala...",border:OutlineInputBorder(borderRadius:BorderRadius.circular(20))))),SizedBox(width:8),CircleAvatar(backgroundColor:Color(0xFF0D47A1),child:IconButton(icon:Icon(Icons.send,color:Colors.white),onPressed:(){if(ctrl.text.isEmpty)return;setState((){msgs.add({"me":true,"t":ctrl.text});ctrl.clear();});}))])),
 ]),
 );
 }
}

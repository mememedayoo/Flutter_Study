//Flutte　公式ドキュメントのやつです
/*
Mateialapp 
Flutterでは、配置、パディング、レイアウトなど、
ほとんどすべてがウィジェット

MaterialライブラリのScaffoldウィジェット
デフォルトのアプリバー、タイトル、およびホーム画面のウィジェットツリーを保持するbodyプロパティを提供
*/
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final wordPair = WordPair.random();
    return MaterialApp(
     // title: 'Welcome to Flutter',
     title: 'StaRt Name GenetoR',
     home: RandomWords(),
      /*home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to DLUTTEWR'),
          backgroundColor: Color.fromARGB(10, 30, 2, 3),
          
        ),
        body: Center(
         // child: Text(wordPair.asPascalCase),
          child: RandomWords(),
        ),
      ),*/ //Step 4まではこれでした
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
/*
Step 3: ステートレスウィジェットは不変.
プロパティは変更できない。すべての値は最終的なもの。
ステートフルウィジェットを実装するには、少なくとも2つのクラスが必要です。
1）インスタンスを作成するStatefulWidgetクラス、
2）ステートクラス。 StatefulWidgetクラス自体は普変ですが、Stateクラスはウィジェットの存続期間中持続します。
*/
class RandomWordsState extends State<RandomWords> {
  
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);  

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
   // return Text(wordPair.asPascalCase);
   return Scaffold(
    appBar: AppBar(
      title: Text('Startup Name Generator'),
    ),
    body: _buildSuggestions(),
  );

  }
  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}

}

//STEP4 CeReate an inifinite sclling ListView
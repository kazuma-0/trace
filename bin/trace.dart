import 'package:http/http.dart' as http;
import 'models/parse.dart';
void main(List<String> arguments) {
  arguments.isEmpty ? print('usage: trace <imageurl>'):trace(arguments[0]); 
}
void trace(String url) async {
  var params = {
    'url': url,
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var res = await http.get('https://trace.moe/api/search?$query');
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  for (var s in resParseFromJson(res.body).docs){
    print('-----------------------------------------------');
    print('${s.titleEnglish.isEmpty ? s.title : s.titleEnglish}     Similarity: ${s.similarity.toString()}');
  }
}
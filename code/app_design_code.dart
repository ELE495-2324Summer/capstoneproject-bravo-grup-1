import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Proje Appi'),
        ),
        body: NumberInput(),
      ),
    );
  }
}

class NumberInput extends StatefulWidget {
  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  final TextEditingController _controller = TextEditingController();
  String _responseMessage = '';
  String _redLineCount = '';
  String _score = '';
  String _parkingStatus = '';
  String _plateStatus = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      fetchData();
    });
  }

  Future<void> sendInput() async {
    final String userInput = _controller.text.isNotEmpty ? _controller.text : '0';
    print('Sending input: $userInput');  // Giriş kontrolü için log ekliyoruz
    try {
      final response = await http.post(
        Uri.parse('http://192.168.81.192:5002/set_input'), // <your-server-ip> yerine Flask sunucunuzun IP adresini yazın
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'input': userInput,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          _responseMessage = jsonResponse['message'];
          _plateStatus = jsonResponse['plateStatus'] ?? 'Plaka Bulunamadi';
          _parkingStatus = jsonResponse['parkingStatus'] ?? 'Park Yapilmadi';
          _redLineCount = jsonResponse['redLineCount']?.toString() ?? '0';
          _score = jsonResponse['score']?.toString() ?? '0';
        });
      } else {
        setState(() {
          _responseMessage = 'Geçersiz giriş, lütfen bir sayı girin.';
        });
      }
    } catch (e) {
      print('Hata: $e');
      setState(() {
        _responseMessage = 'Sunucuya bağlanılamadı, lütfen tekrar deneyin.';
      });
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.81.192:5002/get_status'), // <your-server-ip> yerine Flask sunucunuzun IP adresini yazın
      );

      print('Fetch response status: ${response.statusCode}');
      print('Fetch response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          _plateStatus = jsonResponse['plateStatus'] ?? 'Plaka Bulunamadi';
          _parkingStatus = jsonResponse['parkingStatus'] ?? 'Park Yapilmadi';
          _redLineCount = jsonResponse['redLineCount']?.toString() ?? '0';
          _score = jsonResponse['score']?.toString() ?? '0';
        });
      }
    } catch (e) {
      print('Veri alınırken bir hata oluştu: $e');
    }
  }

  void _onSendButtonPressed() {
    sendInput();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Plakayı Yazın'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSendButtonPressed,
              child: Text('Gönder'),
            ),
            SizedBox(height: 20),
            Text(_responseMessage),
            SizedBox(height: 20),
            Text(
              'Kırmızı çizgiye basma sayısı',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _redLineCount,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Puan durumu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _score,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Park Durumu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _parkingStatus,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Plaka bulunma durumu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _plateStatus,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

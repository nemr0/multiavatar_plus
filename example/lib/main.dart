import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar_plus/multiavatar_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultiAvatar example',
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(title: 'MultiAvatar example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _avatarSvg = '';
  GenderType _gender = GenderType.neutral;
  String _avatarSeed = '';
  void _generateAvatar({bool useLastSeed = false}) {
    if (!useLastSeed) {
      _avatarSeed = DateTime.now().toIso8601String();
    }
    setState(() {
      _avatarSvg = multiavatar(_avatarSeed, gender: _gender);
    });
  }

  @override
  void initState() {
    super.initState();
    _generateAvatar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _generateAvatar,
        tooltip: 'Generate',
        icon: Icon(Icons.gesture),
        label: Text('Generate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(
              _avatarSvg,
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            DropdownButton<GenderType>(
              value: _gender,
              items: GenderType.values.map((GenderType gender) {
                return DropdownMenuItem<GenderType>(
                    value: gender, child: Text(gender.name));
              }).toList(),
              onChanged: (GenderType? newGender) {
                setState(() {
                  _gender = newGender ?? GenderType.neutral;
                });
                _generateAvatar(useLastSeed: true);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  highlightColor: Colors.deepPurple.withValues(alpha: 0.1),
                  overlayColor: WidgetStateProperty.all(
                      Colors.deepPurple.withValues(alpha: 0.1)),
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: _avatarSvg));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('SVG code copied to clipboard')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(_avatarSvg, textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

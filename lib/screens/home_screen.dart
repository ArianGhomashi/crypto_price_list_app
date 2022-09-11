import 'package:crypto_price_list_app/data/constants/constants.dart';
import 'package:crypto_price_list_app/screens/crypto_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../data/model/Crypto.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Crypto>? cryptoList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.coins,
              size: 150,
              color: greenColor,
            ),
            SizedBox(
              height: 30,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  void _getdata() async {
    var response = await Dio().get('https://api.coincap.io/v2/assets');
    var jsonMapObject = response.data['data'];
    cryptoList = response.data['data']
        .map<Crypto>((jsonMapObject) => Crypto.fromJsonObject(jsonMapObject))
        .toList();

    if (cryptoList == null) {
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoinListScreen(cryptoList: cryptoList),
        ));
  }
}

//TODO: Add your imports here.
import 'dart:convert';
import 'package:http/http.dart' as http;
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '5DA6152E-5B91-4432-B579-8E5D531F1A85';

class CoinData {
   Future getCoinData(String selectedCurrency)async{
    String Url='$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';
    http.Response res=await http.get(Uri.parse(Url));
    if (res.statusCode == 200) {
      var decodedData = jsonDecode(res.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(res.statusCode);
      throw 'Problem with the get request';
    }
  }

}
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
// FIXME: Change api key here and remove before commit it.
const apikey = 'Get api key from email here';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apikey';
    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['rate'];
    } else {
      throw 'Error {$response.statusCode} fetching data';
    }
  }
}

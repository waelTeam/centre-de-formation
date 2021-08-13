// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// import 'package:centredeformation/screens/modules/shop_app/login/shop_login_screen.dart';
import 'package:centredeformation/screens/shared/components/components.dart';
import 'package:centredeformation/screens/shared/network/local/cache_helper.dart';
// void signOut(context) {
//   CacheHelper.removeData(
//     key: 'token',
//   ).then((value) {
//     if (value) {
//       navigateAndFinish(
//         context,
//         ShopLoginScreen(),
//       );
//     }
//   });
// }

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';

String uId = '';



//const of firebase
const kformationId = 'formationID';
const kformationName = 'formationName';
const kformationAddress = 'formationAddress';
const kformationDescription = 'formationDescription';
const kformationImage = 'formationImage';
const kformationCategory = 'formationCategory';
const kformationvideo='formationVideo';
const kformationPrice='formationPrice';
const kformationCollection = 'Formations';

const kannonceName = 'formationName';
const kannonceAddress = 'annonceAddress';
const kannonceDescription = 'annonceDescription';
const kannonceImage = 'annonceImage';
const kannonceCategory = 'annonceCategory';
const kannonceContact='annonceContact';
const kannonceCollection = 'Annonces';
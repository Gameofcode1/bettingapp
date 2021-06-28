
import 'package:betejee/ui/widget/home_screen/gameimageslider.dart';

class GamesImages {
  List<GameImageSlider> _gamesimages = [
    GameImageSlider(
      imagemane: "images/sports.jpg",
    ),
    GameImageSlider(
      imagemane: "images/barsa.jpg",
    ),
    GameImageSlider(
      imagemane: "images/champain1.jpg",
    ),
    GameImageSlider(
      imagemane: "images/champian.jpg",
    ),
    GameImageSlider(
      imagemane: "images/messi.jpg",
    ),
  ];

   List<GameImageSlider> get gamesimages{
     return [..._gamesimages];


   }
}

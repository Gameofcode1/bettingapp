import 'package:betejee/ui/widget/home_screen/productLikeSlider.dart';

class ProductLikeImages {
  List<ProductLikeSlider> _productlikeimages = [
    ProductLikeSlider(
      imagemane: "images/boot.jpg",
    ),
    ProductLikeSlider(
      imagemane: "images/tennis.jpg",
    ),
    ProductLikeSlider(
      imagemane: "images/cricket.jpg",
    ),
    ProductLikeSlider(
      imagemane:"images/betsport.jpg",
    ),
  ];

  List<ProductLikeSlider> get productlikeimages {
    return [..._productlikeimages];
  }
}

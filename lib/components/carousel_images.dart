import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<String> imgList;

  const CarouselWithIndicator({Key key, @required this.imgList}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  // List<String> imgList = [
  //   "https://firebasestorage.googleapis.com/v0/b/stepgolf-63564.appspot.com/o/images%2FCapture%20d%E2%80%99e%CC%81cran%202021-06-13%20a%CC%80%2011.45.10.png?alt=media&;amp;token=f771edd8-4d85-4f90-8028-2bb83bba4173",
  //   "https://firebasestorage.googleapis.com/v0/b/stepgolf-63564.appspot.com/o/images%2FCapture%20d%E2%80%99e%CC%81cran%202021-06-16%20a%CC%80%2008.52.56.png?alt=media&;amp;token=b37d48eb-e8a6-4102-b863-1989fc3f63bc",
  //   "https://firebasestorage.googleapis.com/v0/b/stepgolf-63564.appspot.com/o/images%2FCapture%20d%E2%80%99e%CC%81cran%202021-07-21%20a%CC%80%2011.21.21.png?alt=media&;amp;token=a67fcd52-3fca-4650-b9d1-ad9a0fff17a4"
  // ];

  List<Widget> imageSliders;
  final CarouselController _controller = CarouselController();

  void initState() {
    // TODO: implement initState
    imageSliders = widget.imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.contain, width: 1000.0),
                      ],
                    )),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

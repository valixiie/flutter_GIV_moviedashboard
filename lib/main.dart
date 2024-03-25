import 'package:flutter/material.dart';
import 'trendingMovies.dart';
import 'image_carousel_slider.dart';
import 'piechartPage.dart';
import 'graphPage.dart';
import 'package:charts_flutter/flutter.dart' as charts;





void main() {
   runApp(
     MaterialApp(
       title: "Project GIV",
       debugShowCheckedModeBanner: false,
       home: BasicGridWidget(),
     ),
   );
 }



class BasicGridWidget extends StatelessWidget {
  const BasicGridWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child:Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF91180B),
                  Color(0xFFB9220F),
                  Color(0xFFE32D13),
                  Color(0xFFF85138),
                  Color(0xFFFF6666),
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height * MediaQuery.of(context).size.width / 6000, // Adjust accordingly
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ImageCarouselSlider();
              },
            ),
          ),
          SizedBox(height: 20), // Add space between GridView and title
          ResponsiveText(
            text: "The Movie Database",
            fontSize: 24.0,
            textColor: Colors.white,
            shadowColor: Colors.grey,
            shadowOffset: Offset(2.0, 2.0),
          ),
          SizedBox(height: 20), // Add space between title and trending movies
          Container(
            height: MediaQuery.of(context).size.height / 1.55,
            child: TrendingMoviesHomePage(),
          ),
          SizedBox(height: 20), // Add space between trending movies and dashboard
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
            child: piechartPage(),
          ),
          SizedBox(height: 20), //
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
            child: graphPage(),
          ),
        ],
      ),
      ),
    );

  }
}








class ResponsiveText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Color shadowColor;
  final Offset shadowOffset;


  ResponsiveText({
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.shadowColor,
    required this.shadowOffset,

  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double responsiveFontSize = screenWidth * fontSize / 400.0;

    return Text(
      text,
      style: TextStyle(
        fontSize: responsiveFontSize,
        color: textColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,

        shadows: [
          Shadow(
            color: shadowColor,
            offset: shadowOffset,

          ),
        ],
      ),
    );
  }
}

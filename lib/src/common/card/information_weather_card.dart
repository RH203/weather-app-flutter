import 'package:flutter/material.dart';

class InformationWeatherCard extends StatelessWidget {
  const InformationWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 120,
      padding: const EdgeInsets.all(8),
      child: const Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            
          ],
        )
      ),
    );
  }
}

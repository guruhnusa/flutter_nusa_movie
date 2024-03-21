import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> promotionList(
  List<String> promotionList,
) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 12, top: 20),
      child: Text(
        'Promotions',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: promotionList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  promotionList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    ),
  ];
}

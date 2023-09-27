import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          'https://i.namu.wiki/i/oZ0HT6_yrgDr01429BJBl5S_G2alYkqs-Rp1jbYE_tDxlY2n-Mp9YOqrcvVFJwXtv-YTcGZVeYknmxLUK3iSKv5e8a4eMX5mhwhMCJnxMAyMmUhb66y43_FnenjavSc2SNSXG5acMZ8EavJ19bbWAQ.webp',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

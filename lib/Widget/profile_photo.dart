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
          'https://i.namu.wiki/i/uwCjHuS8HlDWf46qN9D-_flVyOu0AMB6IFni65P854bjTMQ2NcJ2D0LPZ253QAGsFbj0QYg9-CB_CYAURSaWnZ1rgU1ucqfNND5dakURS4nY--kOwHnr7U67tb3UgcIK7gfQQ4Isoxs5T-0kYe_HVQ.webp',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

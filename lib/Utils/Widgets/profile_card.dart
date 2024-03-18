
import 'package:flutter/material.dart';
import 'package:salesfokuz_mt/Utils/TextStyles/textStyles.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String bio;
  final String follwers;
  final String following;
  final String twitter;
   ProfileCard({super.key,required this.name,
  required this.imageUrl,
    required this.bio,
    required this.following,
    required this.follwers,
     required this.twitter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(10)
      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              CircleAvatar(
                radius: 120,
                backgroundImage: NetworkImage(
                    imageUrl), // URL for profile image
              ),
              SizedBox(height: 30),
              Text(
                name, // Name
                style: profileNameStyle,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  bio, // Bi
                  textAlign: TextAlign.center,// o
                  style: profileOtherStyle,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Twitter(X) : '+ twitter, // Followers count
                style: profileOtherStyle,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Followers : '+ follwers, // Followers count
                    style: profileOtherStyle,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Following : '+ following, // Following count
                    style: profileOtherStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

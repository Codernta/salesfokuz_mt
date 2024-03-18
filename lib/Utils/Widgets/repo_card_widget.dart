

import 'package:flutter/material.dart';

import '../TextStyles/textStyles.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoCard extends StatelessWidget {
  final String repoName;
  final String repoDesc;
  final String cloneUrl;
  final String watchCount;
  final String language;
  final String createdAt;
  final String updatedAt;

  const RepoCard({super.key,required this.cloneUrl,required this.createdAt,required this.language,required this.repoDesc,required this.repoName,required this.updatedAt,required this.watchCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(repoName,style: repoCardStyle,),
            Text(repoDesc, style: repoDescCardStyle,),
          Linkify(
            style: repoDescCardStyle,
            onOpen: (link) async {
              if (!await launchUrl(Uri.parse(cloneUrl))) {
                throw Exception('Could not launch ${cloneUrl}');
              }
            },
            text: 'Url: '+cloneUrl,
          ),
            Text('Watch Count: '+watchCount, style: repoDescCardStyle,),
            Text('Language: '+language, style: repoDescCardStyle,),
            Text('Created At: '+createdAt, style: repoDescCardStyle,),
            Text('Updated At: '+updatedAt, style: repoDescCardStyle,),
          ],
        ),
      ),
    );
  }
}

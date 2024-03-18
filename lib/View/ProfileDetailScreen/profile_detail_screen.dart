import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesfokuz_mt/Provider/user_detail_provider.dart';
import 'package:salesfokuz_mt/Utils/TextStyles/textStyles.dart';
import 'package:salesfokuz_mt/Utils/Widgets/profile_card.dart';
import 'package:salesfokuz_mt/Utils/Widgets/repo_card_widget.dart';

class GitHubProfilePage extends StatefulWidget {
  final String username;

  const GitHubProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  State<GitHubProfilePage> createState() => _GitHubProfilePageState();
}

class _GitHubProfilePageState extends State<GitHubProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GitHubProfileProvider(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('GitHub Profile',style: profileNameStyle,),
            bottom: TabBar(
              labelStyle: profileOtherStyle,
              tabs: const [
                 Tab(text: 'Profile',),
                Tab(text: 'Repositories'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Consumer<GitHubProfileProvider>(
                builder: (context, provider, _) {
                  if (provider.user == null) {
                    provider.fetchUserData(widget.username);
                    return loader();
                  } else {
                    return ProfileCard(name: provider.user!.name,
                      imageUrl: provider.user!.avatarUrl,
                      bio: provider.user!.bio,
                      following: provider.user!.following.toString(),
                      follwers: provider.user!.followers.toString(), twitter: provider.user!.twitterUsername,);
                  }
                },
              ),
              Consumer<GitHubProfileProvider>(
                builder: (context, provider, _) {
                  if (provider.repositories == null) {
                    provider.fetchRepositories(widget.username);
                    return loader();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.separated(
                        separatorBuilder: (context,index){
                          return const SizedBox(height: 10,);
                        },
                        itemCount: provider.repositories!.length,
                        itemBuilder: (context, index) {
                          return provider.repositories!.isEmpty ?noRepo() :RepoCard(cloneUrl: provider.repositories![index].cloneUrl,
                            createdAt: provider.repositories![index].createdAt.toString(),
                            language: provider.repositories![index].language,
                            repoDesc: provider.repositories![index].description,
                            repoName: provider.repositories![index].name,
                            updatedAt: provider.repositories![index].updatedAt.toString(),
                            watchCount: provider.repositories![index].watchersCount.toString(),

                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  noRepo() {
    return Center(
      child: Text('No Repositiries found!',style: repoCardStyle,),
    );
  }

  Widget loader() {
    return const Center(
      child: CircleAvatar(
        radius: 20,
        child: Padding(
          padding: EdgeInsets.all(7),
        child: CircularProgressIndicator(),),
      ),
    );
  }
}
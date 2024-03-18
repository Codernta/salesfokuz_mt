

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:salesfokuz_mt/Provider/user_search_provider.dart';
import 'package:salesfokuz_mt/Utils/TextStyles/textStyles.dart';
import 'package:salesfokuz_mt/View/ProfileDetailScreen/profile_detail_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('GitHub Search',style: profileNameStyle,),
        ),
        body: ChangeNotifierProvider(
            create: (_)=> UserProvider(),
            child: const UserSearch())
      ),
    );
  }
}

class UserSearch extends StatefulWidget {
  const UserSearch({super.key});

  _UserSearchState createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
   TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context,listen:false).searchUsers(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration:  InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide:  BorderSide(
                    width: 1.0,
                    color: Colors.blue.shade900, // Border color
                  ),
                ),
                labelText: 'Search Users'),
            onChanged: (value) {
             userProvider.searchUsers(_searchController.text);
            },
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount:  userProvider.users.length,
              itemBuilder: (context, index) {
                return userProvider.loading ? loader():Card(
                  child: ListTile(
                    onTap:()=> Get.to(()=> GitHubProfilePage(username: userProvider.users[index].login)),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(userProvider.users[index].avatarUrl),
                    ),
                    title: Text(userProvider.users[index].login,style: profileOtherStyle,),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


   Widget loader() {
     return Container(
       height: 60,
       color: Colors.grey.shade100,
       child: ListTile(
         title: Container(
           height: 15,
           color: Colors.grey.shade300,
         ),
         leading: CircleAvatar(
           radius: 20,
           backgroundColor: Colors.grey.shade300,
         ),
       ),
     );
   }
}

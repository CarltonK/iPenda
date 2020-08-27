import 'package:flutter/material.dart';
import 'package:iPenda/models/message_model.dart';
import 'package:iPenda/screens/home/profile/user_profile.dart';
import 'package:iPenda/utilities/global/pageTransitions.dart';

class NewMatches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              'New Matches',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            height: 120,
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                addAutomaticKeepAlives: false,
                itemCount: favorites.length,
                padding: EdgeInsets.only(left: 10.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      SlideUpTransition(
                        page: UserProfile(
                          user: favorites[index],
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                              favorites[index].imageUrl,
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            favorites[index].name,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

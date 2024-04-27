import 'package:flutter/material.dart';
import 'package:utscoba/utils/session_manager.dart';


class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  String? username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataSession();
  }

  //untuk mendapatkan sesi
  Future getDataSession() async{
    await Future.delayed(const Duration(seconds: 5),(){
      session.getSession().then((value){
        print('Data sesi ..'+ value.toString());
        username = session.username;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                    radius: 55,
                    child: Icon(
                      Icons.person,
                      color: Colors.green,
                      size: 65,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text('${session.username}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                SizedBox(
                  height: 10,
                ),
                // Text('Username : ${session.userName}'),
                // Text('Email : ${session.email}'),
                // Text('No HP : ${session.nohp}'),
                SizedBox(
                  height: 10,
                ),
                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       side: const BorderSide(width: 1, color: Colors.blueGrey)),
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => PageEditProfile()));
                //   },
                //   child: Text('Edit Profile'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
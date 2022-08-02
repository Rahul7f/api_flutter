import 'package:api_flutter/service/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? post;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    post = await RemoteService().getPost();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Demo"),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
            itemCount: post?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: [
                          Text(
                            post![index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          Text(
                            post![index].body??'',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,

                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              );
            }),
      ),
    );
  }
}

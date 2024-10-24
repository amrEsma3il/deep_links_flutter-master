import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// import 'bloc.dart';
import 'deep_link_cubit.dart';
import 'home_screen.dart';

class PocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return BlocListener<AppLinkCubit, Uri?>(
  listener: (context, uri) {
    if (uri != null) {
      print(uri.queryParameters);
        log("page :" +uri.queryParameters["page"].toString());
              log("feature :" +uri.queryParameters["feature"].toString());
                   log("verse :" +uri.queryParameters["verse"].toString());
      // Handle any path dynamically
      if (uri.host == 'www.facebook.com') {
        log("path :" +uri.path.toString());
           
        // Example handling for Facebook deep link
        if (uri.path == '/one') {
           Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenOne()),
        );
        } else if (uri.path == '/two') {
           Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenTwo()),
        );
        }else{
           Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        }
       
      } 
     
      else {
       log("unkwon host");
      }
    }
  },
  child: Scaffold(body: Center(child:Text("hi from deep link test page")),),
);

  }
}

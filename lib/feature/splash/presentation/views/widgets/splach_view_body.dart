import 'package:book_store_getx/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplachViewBody extends StatelessWidget {
  const SplachViewBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset(AssetsData.logo,width:300,height: 300,fit: BoxFit.fill,)],
      ),
    );
  }
}

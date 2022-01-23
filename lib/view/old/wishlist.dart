
import 'package:dayjour_version_3/app_localization.dart';
import 'package:dayjour_version_3/const/app_colors.dart';
import 'package:dayjour_version_3/controler/cart_controller.dart';
import 'package:dayjour_version_3/controler/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


class Wishlist extends StatelessWidget {
  Wishlist({Key? key}) : super(key: key);

  CartController cartController = Get.find();
  WishListController wishlistController = Get.find();

  _wishlist(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: wishlistController.wishlist.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset:
                      Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.95,
                          height: MediaQuery.of(context).size.height * 0.18,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  wishlistController.wishlist[index].image.toString() == null
                                      ? "https://www.pngkey.com/png/detail/85-853437_professional-makeup-cosmetics.png"
                                      :  wishlistController.wishlist[index].image.toString()
                              ),
                            ),
                          ),
                          child:
                          Padding(
                            padding: const EdgeInsets.only(right: 8 , top: 5),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5 , top: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        wishlistController.delete_from_wishlist(wishlistController.wishlist[index]);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Text(
                            wishlistController.wishlist[index].title.toString(),
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showTopSnackBar(
                              context,
                              CustomSnackBar.success(
                                message: App_Localization.of(context).translate("Just_Added_To_Your_Cart"),
                                //backgroundColor: AppColors.main2,
                              ),
                            );
                            cartController.add_to_cart(wishlistController.wishlist[index],1);
                            // showTopSnackBar(
                            //   context,
                            //   CustomSnackBar.success(
                            //     message: "Just Added To Your Cart",
                            //   ),
                            // );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.main2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                App_Localization.of(context)
                                    .translate("add_to_cart"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 30)
            ],
          ) ;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
              () => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.main,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      child: Row(
                        children: [
                          Text(
                            App_Localization.of(context).translate("wishlist"),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 15),
                  _wishlist(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

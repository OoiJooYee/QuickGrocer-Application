import 'package:flutter/material.dart';
import 'package:quickgrocer_application/src/constants/colors.dart';
import 'package:quickgrocer_application/src/constants/text_strings.dart';
import 'package:quickgrocer_application/src/features/core/screens/checkout/checkout_card.dart';

class ViewOrderDetailsBuyerScreen extends StatefulWidget {
  const ViewOrderDetailsBuyerScreen ({super.key,});

  @override
  State<ViewOrderDetailsBuyerScreen> createState() => _ViewOrderDetailsBuyerScreenState();
}

class _ViewOrderDetailsBuyerScreenState extends State<ViewOrderDetailsBuyerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          viewOrderDetailsTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                orderComplete,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              SizedBox(
                height: 400,
                child: ListView(
                  children: [
                    CheckoutCard(),
                    CheckoutCard(),
                    CheckoutCard()
                  ],
                ),
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderID,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        'OR00000001',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderTime,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        '12-12-2023 12:12',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentTime,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        '12-12-2023 12:21',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        completeTime,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        '13-12-2023 13:12',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ]
          ),
      )),
      bottomSheet: BottomAppBar(
        height: MediaQuery.of(context).size.height / 12,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                //'\RM' '${widget.grocery.price.toStringAsFixed(2)}',
                totalPrice,
                style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20),
                backgroundColor: AppColors.mainPineColor,
                shape: StadiumBorder()),
                icon: Icon(Icons.star_rate_rounded),
                label: Text('Rate'),
              )
      ]))),
    );
  }
}
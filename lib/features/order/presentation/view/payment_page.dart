// import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_product.dart';
import 'package:e_commerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
// import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:e_commerce_app/features/order/data/models/order_model.dart';
// import 'package:e_commerce_app/features/order/presentation/view/orders_page.dart';
import 'package:e_commerce_app/features/order/presentation/view/succes_page.dart';
import 'package:e_commerce_app/features/order/presentation/view_model/order_cubit/order_cubit.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.country,
    required this.city,
    required this.address,
    required this.totalPrice,
    required this.checkoutProducts,
    required this.fullName,
    required this.isFromCart,
  });
  final String fullName;
  final String country;
  final String city;
  final String address;
  final double totalPrice;
  final List<CartProduct> checkoutProducts;
  final bool isFromCart;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    final total = 1919.99;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12, width: 0.4),
                ),
                child: Icon(Icons.chevron_left_rounded, size: 28),
              ),
            ),
            SizedBox(width: 16),
            Text(
              'Payment Method',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _sectionTitle("Shipping Address"),
          _card(
            child: ListTile(
              leading: const Icon(
                CupertinoIcons.location_circle,
                color: Colors.redAccent,
                size: 30,
              ),
              title: Text(widget.fullName),
              subtitle: Text('${widget.city}, ${widget.country}'),
              trailing: const Icon(Icons.edit),
            ),
          ),

          //  Payment Methods
          _sectionTitle("Payment Method"),

          _paymentTile(0, Icons.credit_card, "Credit Card"),
          _paymentTile(1, Icons.account_balance_wallet, "Cash on Delivery"),
          _paymentTile(2, Icons.paypal, "PayPal"),

          const Spacer(),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,

        children: [
          Container(
            height: 185,
            padding: const EdgeInsets.only(
              top: 20,
              right: 16,
              left: 16,
              bottom: 8,
            ),
            margin: EdgeInsets.only(bottom: 18, right: 10, left: 10),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withAlpha(30),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black12, width: 0.8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'sub Total:',
                      style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${widget.totalPrice.toStringAsFixed(2)} \$',
                      style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      'Shipping:',
                      style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Free',
                      style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      'Est. Total:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${widget.totalPrice.toStringAsFixed(2)} ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                GestureDetector(
                  onTap: () => _payNow(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    width: double.infinity,
                    // height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            'Confirm Order',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -17,
            right: 3,
            child: Container(
              // height: 40,
              // width: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12, width: 0.8),
              ),
              child: Center(
                child: Text(
                  '${widget.checkoutProducts.length}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          ...List.generate(
            widget.checkoutProducts.length > 5
                ? 6
                : widget.checkoutProducts.length,
            (index) => Positioned(
              top: -16,
              left: index * 28.0,
              child: Container(
                // height: 40,
                // width: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12, width: 0.8),
                ),
                child: index == 5
                    ? Padding(
                        padding: const EdgeInsets.all(3.8),
                        child: Text(
                          '+${widget.checkoutProducts.length - 5}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      )
                    : Image.network(
                        widget.checkoutProducts[index].product.images![0],
                        height: 30,
                        width: 24,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Payment Tile
  Widget _paymentTile(int index, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = index;
        });
      },
      child: _card(
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(title),
            const Spacer(),
            Radio(
              value: index,
              groupValue: selectedMethod,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Section Title
  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  // 🔹 Card Wrapper
  Widget _card({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 0.4),
      ),
      child: child,
    );
  }

  //  Pay Action
  void _payNow(BuildContext context) {
    final order = Order(
      id: DateTime.now().toString(),
      items: widget.checkoutProducts,
      total: widget.totalPrice,
      date: DateTime.now(),
      city: widget.city,
      country: widget.country,
      address: widget.address,
    );

    confirmMessage(context, order);
  }

  void confirmMessage(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.green, size: 30),
            ),
            SizedBox(height: 16),
            Text(
              'Are you sure you want to confirm your order?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 29),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  isBorder: true,
                  title: 'Cancel',
                  onTap: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => OrdersPage()),
                    // );
                    Navigator.pop(context);
                  },
                  verticalPadding: 3,
                  color: Colors.transparent,
                  textColor: AppColors.primaryColor,
                  horizontalMargin: 8,
                  titleSize: 14,
                ),
                CustomButton(
                  title: 'Confirm',
                  titleSize: 14,
                  onTap: () {
                    // BlocProvider.of<CartCubit>(context).clearCart();
                    BlocProvider.of<OrderCubit>(context).addOrder(order);
                    widget.isFromCart
                        ? BlocProvider.of<CartCubit>(context).clearCart()
                        : null;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderSuccessPage(
                          orderId: order.id,
                          estimatedDelivery: order.date.toString(),
                          itemCount: order.items.length,
                          totalAmount: order.total,
                        ),
                      ),
                    );
                    // Navigator.pop(context);
                  },
                  verticalPadding: 4,
                  color: Colors.green.withAlpha(50),
                  textColor: Colors.green,
                  horizontalMargin: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

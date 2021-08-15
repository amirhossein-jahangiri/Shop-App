import 'cart_item.dart' as ci;

class OrderItem{
  final String? id;
  final double? amount;
  final List<ci.CartItem>? products;
  final DateTime? dateTime;

  const OrderItem({
    this.id,
    this.amount,
    this.products,
    this.dateTime,
  });
}
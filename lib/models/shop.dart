import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'shoes.dart';

class Shop extends ChangeNotifier {
  //list of shoes
  final List<Shoes> _menu = [
    //Nike
    Shoes(
      name: 'Nike AirForce 1 LV8',
      description:
          'สบาย ทนทาน เหนือกาลเวลา นั่นคือเหตุผลที่ทำให้คู่นี้เป็นไอเท็มอันดับ 1 ที่คนยอมรับ ',
      imagePath: 'lib/assets/images/nike/Nike_AirForce_1_LV8.png',
      price: 4700,
      category: ShoesCategory.nike,
    ),

    Shoes(
      name: 'Nike Air Force 1 LV8 4',
      description:
          'สีคัลเลอร์บล็อคแบบแอ็บสแตรกต์และจิตรกรรมฝาผนังสีสันสดใสกำลังคืนชีวิตชีวาให้กับคอร์ทบาสเก็ตบอลสาธารณะทั่วอเมริกา ',
      imagePath: 'lib/assets/images/nike/Nike_airForce_1_LV8_4.png',
      price: 3400,
      category: ShoesCategory.nike,
    ),

    Shoes(
      name: 'Nike Cortez',
      description:
          'จากวันนั้นในปี 1972 สู่วันนี้ในปี 2023 บางครั้งเลขยิ่งเยอะก็ยิ่งดีขึ้นไปอีก ',
      imagePath: 'lib/assets/images/nike/Nike_CT.png',
      price: 3200,
      category: ShoesCategory.nike,
    ),

    Shoes(
      name: 'Nike Jordan 1 Low SE',
      description:
          'นี่คือ AJ1 ที่น้อยแต่มาก คุณคงไม่อยากให้น้อยไปกว่านี้แล้วใช่ไหมล่ะ รุ่นนี้รังสรรค์ขึ้นจากหนังผิวเรียบและมาพร้อมระบบลดแรงกระแทก Nike Air ที่พื้นรองเท้าซึ่งให้ความสบาย',
      imagePath: 'lib/assets/images/nike/Nike_jd1lse.png',
      price: 4700,
      category: ShoesCategory.nike,
    ),

    Shoes(
      name: 'Nike Waffle Nav',
      description:
          'เติมความโมเดิร์นให้รองเท้าเรโทรกับสนีกเกอร์คู่เพรียวสวยที่ได้แรงบันดาลใจจาก Nike Daybreak วัสดุไนลอนและหนังกลับเป็นองค์ประกอบที่สะท้อนยุคสมัยผ่านคู่สี ',
      imagePath: 'lib/assets/images/nike/Nike_WN.png',
      price: 3000,
      category: ShoesCategory.nike,
    ),

    //adidas
    Shoes(
      name: 'Adidas SUPERSTAR',
      description:
          'ย้อนวันวานอย่างมีสไตล์ รองเท้าอาดิดาส Superstar ที่เป็นไอคอนคู่นี้ก้าวล้ำนำสมัยตั้งแต่เปิดตัวครั้งแรกบนท้องถนนในยุค 70 ',
      imagePath: 'lib/assets/images/adidas/addias_SUPERSTAR.png',
      price: 4000,
      category: ShoesCategory.adidas,
    ),

    Shoes(
      name: 'Adidas RUN 80S',
      description:
          'สวมรองเท้าลุคเก๋าที่มาพร้อมความสบายจากยุคปัจจุบัน รองเท้าที่ได้แรงบันดาลใจจากรองเท้าวิ่งคู่นี้มีส่วนรับแรงกระแทก Cloudfoam สุดนุ่มในพื้นชั้นกลางเพื่อให้คุณเคลื่อนไหวได้ต่อเนื่องยาวนานตลอดวัน',
      imagePath: 'lib/assets/images/adidas/adidas_RUN_80S.png',
      price: 2500,
      category: ShoesCategory.adidas,
    ),

    Shoes(
      name: 'Adidas STAN SMITH CS',
      description:
          'รองเท้า Adidas Stan Smith ยังคงโดดเด่นด้วยดีไซน์เหนือกาลเวลา ในขณะเดียวกันก็ใช้สีสันและรูปแบบที่ทันสมัย คู่นี้นำความคลาสสิกมาพลิกโฉมลุคใหม่',
      imagePath: 'lib/assets/images/adidas/adidas_STANSMITHCS.png',
      price: 4000,
      category: ShoesCategory.adidas,
    ),

    Shoes(
      name: 'Adidas SUPERNOVA STRIDE MOVE FOR THE PLANET',
      description:
          'ก้าวไปสู่เป้าหมายการวิ่งของคุณด้วยรองเท้า Adidas คู่นี้ พื้นรองเท้าชั้นกลาง Dreamstrike+ ได้รับการปรับแต่งเพื่อดูดซับแรงกระแทก ระบบลดแรงกระแทกเพิ่มเติมที่ปลายเท้าให้ความสบายตลอดการวิ่ง',
      imagePath: 'lib/assets/images/adidas/adidas_SUPERNOVA_STRIDE.png',
      price: 3600,
      category: ShoesCategory.adidas,
    ),

    Shoes(
      name: 'Adidas TRAE YOUNG 3 LOW',
      description:
          'เตรียมตัวให้พร้อมสำหรับสิ่งต่อไป รองเท้าซิกเนเจอร์ของ Trae Young และ adidas Basketball ครั้งนี้นำเสนออนาคตของเกม ',
      imagePath: 'lib/assets/images/adidas/adidas_ty3l.png',
      price: 5500,
      category: ShoesCategory.adidas,
    ),

    //puma
    Shoes(
      name: 'Puma X Playstation',
      description:
          'การร่วมงานกันระหว่าง PUMA x PLAYSTATION คือสองตํานานที่มาร่วมกันผลักดันขีดจำกัดด้วยผลงานที่ได้รับแรงบันดาลใจจากโลกของเกมที่เต็มไปด้วยจินตนาการ',
      imagePath: 'lib/assets/images/puma/puma_pstt.png',
      price: 4000,
      category: ShoesCategory.puma,
    ),

    Shoes(
      name: 'Puma Caracal',
      description:
          'ด้วยเส้นสายยาวสะอาดตา ส่วนบนทำจากหนังระดับพรีเมียม และเค้าโครงที่ได้แรงบันดาลใจจากเทนนิส รองเท้ากีฬา Caracal จึงกลายเป็นสไตล์ประจำตัวสุดเฉียบของคุณ',
      imagePath: 'lib/assets/images/puma/puma_caracal.png',
      price: 1500,
      category: ShoesCategory.puma,
    ),

    Shoes(
      name: 'Puma club',
      description:
          'นําสไตล์ที่สมบูรณ์แบบมาสู่ท้องถนนด้วยโครงร่างที่ได้รับแรงบันดาลใจจากฟุตบอล รองเท้ากีฬา PUMA Club ของเราจับคู่ส่วนบนที่เป็นหนังกลับกับองค์ประกอบคลาสสิกของ PUMA',
      imagePath: 'lib/assets/images/puma/puma_club.png',
      price: 1875,
      category: ShoesCategory.puma,
    ),

    Shoes(
      name: 'Puma Palermo Lth',
      description:
          'คอลเลกชัน Palermo รุ่นใหม่นี้มีป้ายที่เป็นเอกลักษณ์บนตัวรองเท้าส่วนบน โครงสร้างหัวรองเท้าแบบตัว T และพื้นรองเท้ายางแบบคลาสสิก ',
      imagePath: 'lib/assets/images/puma/Puma_Palermo_Lth.png',
      price: 3500,
      category: ShoesCategory.puma,
    ),

    Shoes(
      name: 'Puma X STAPLE Slipstream',
      description:
          'ด้วยคอลเลกชัน PUMA x STAPLE ชุดใหม่ เราสานต่อเรื่องราวของหนังสือพิมพ์ Gidra ซึ่งเริ่มกิจการในแคลิฟอร์เนียเมื่อปี 1969 ',
      imagePath: 'lib/assets/images/puma/puma_STAPLE_Slipstream.png',
      price: 1800,
      category: ShoesCategory.puma,
    ),

    //jordan
    Shoes(
      name: 'Jordan 1 Low',
      description:
          'Air Jordan 1 Low ได้แรงบันดาลใจจากรุ่นออริจินัลที่เปิดตัวในปี 1985 ด้วยลุคคลาสสิกสะอาดตาอย่างที่คุ้นเคย ',
      imagePath: 'lib/assets/images/jordan/jordan_1low.png',
      price: 4300,
      category: ShoesCategory.jordan,
    ),

    Shoes(
      name: 'Jordan 1 Mid',
      description:
          'รองเท้าหุ้มข้อปานกลางรุ่นนี้ได้แรงบันดาลใจจาก AJ1 รุ่นออริจินัล ',
      imagePath: 'lib/assets/images/jordan/jordan_1mid.png',
      price: 4900,
      category: ShoesCategory.jordan,
    ),

    Shoes(
      name: 'Jordan Jumpman',
      description:
          'สวมแล้วออกลุย เพลิดเพลินไปกับระบบลดแรงกระแทกจากโฟมหนาน้ำหนักเบาสําหรับวันเที่ยวชายหาดหรือแฮงเอาท์หลังจบเกม',
      imagePath: 'lib/assets/images/jordan/jordan_jumpman.png',
      price: 1400,
      category: ShoesCategory.jordan,
    ),

    Shoes(
      name: 'Jordan Nu Retro 1 Low',
      description:
          'ผ่านมา 20 ปี รองเท้าไม่หุ้มข้อคู่นี้ได้กลับมาอีกครั้ง รองเท้าได้แรงบันดาลใจจากโลโก้ Wings แบบออริจินัลและดีไซน์ของ Jordan 1 ',
      imagePath: 'lib/assets/images/jordan/jordan_nuretro1low.png',
      price: 4100,
      category: ShoesCategory.jordan,
    ),

    Shoes(
      name: 'Jordan One Take 5 PF',
      description:
          'เร่งความเร็ว พุ่งเข้าหาแป้น ชู้ต ทำแต้ม แล้วก็วนใหม่ รองเท้ารุ่นล่าสุดของ Russell Westbrook พร้อมช่วยเดินเกมเร็วเพื่อให้คุณฟาสต์เบรกได้ต่อเนื่องแบบไม่มียั้ง ',
      imagePath: 'lib/assets/images/jordan/jordan_onetake5.png',
      price: 3700,
      category: ShoesCategory.jordan,
    ),
  ];

  /*

  GETTERS

  */

  List<Shoes> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*

  OPERATIONS

  */

  //user cart
  final List<CartItem> _cart = [];

  //ADD TO CART
  void addToCart(Shoes shoes) {
    //check shoes same
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check ถ้ารองเท้าเหมือนกัน
      bool isSameShoes = item.shoes == shoes;
      return isSameShoes;
    });
    //ถ้ามันมีอยุ่จำนวนก็จะเพิ่มขึ้น
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //ถ้าไม่มีเพิ่มไปที่ตะกร้า
    else {
      _cart.add(
        CartItem(shoes: shoes),
      );
    }
    notifyListeners();
  }

  //REMOVE FROM CART
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  //GET TOTAL PRICE OF CART
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.shoes.price;
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //GET TOTAL NUMBER OF ITEMS IN CART
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //CLEAR CART
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*

  HELPERS

  */

  //GENERATE A RECEIPT
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Youre receipt..");
    receipt.writeln();

    //Date to include up to seconds only
    String formattedDate =
        DateFormat("yyyy--mm--dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("--------");

    for (final cartItem in cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.shoes.name} - ${_formatPrice(cartItem.shoes.price)}");
    }
    receipt.writeln("-----");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    return receipt.toString();
  }

  //FORMAT DOUBLE VAULE INTO MONEY
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }
}

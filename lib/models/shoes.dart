class Shoes {
  final String name; //Nike Cortez
  final String description; //จากวันนั้นในปี 1972 สู่วันนี้ในปี 2023 บางครั้งเลขยิ่งเยอะก็ยิ่งดีขึ้นไปอีก เราได้ปรับโฉมดีไซน์และรังสรรค์ลุคเลื่องชื่อขึ้นมาใหม่ โดยมีส่วนปลายเท้าที่กว้างขึ้นและแผงด้านข้างที่กระชับขึ้นเพื่อให้สวมใส่สบายในทุกๆ วัน วัสดุที่ปรับใหม่ช่วยป้องกันการบิดงอและเพิ่มความทนทาน ขณะเดียวกันก็ยังคงรูปทรงสุดคลาสสิกจากปี 1972 ที่คุณหลงรักเอาไว้ สวมรองเท้าเลย เพราะความออริจินัลนี้มีแต่จะดีขึ้นเรื่อยๆ
  final String imagePath; // lib/images/nike
  final double price; // ฿
  final ShoesCategory category; //Nike

  Shoes({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
  });
}

//Shoes categories
enum ShoesCategory {
  nike,
  adidas,
  puma,
  jordan,
}

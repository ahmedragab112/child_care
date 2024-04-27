class ServicesMode {
 final String imagee;
 final String name;
 const ServicesMode({required this.imagee, required this.name});
}

List<ServicesMode> services = const[
  ServicesMode(imagee: 'assets/images/sleep.png', name: 'النوم '),
  ServicesMode(imagee: 'assets/images/food.png', name: 'الاكل '),
  ServicesMode(imagee: 'assets/images/change.png', name: 'التغيير '),
  ServicesMode(imagee: 'assets/images/tempreture.png', name: 'درجة الحرارة '),
  ServicesMode(imagee: 'assets/images/baby_milke.png', name: 'الرضاعة'),
  ServicesMode(imagee: 'assets/images/medicent.png', name: 'الدواء'),
];

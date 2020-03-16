import 'person_model.dart';

class PersonDetail {
  final Person opponent;
  final String birthday;
  final String hobby;
  final bool isLiked;

  PersonDetail({
    this.opponent,
    this.birthday,
    this.hobby,
    this.isLiked
  });
}

final Person currentPerson = Person(
  id: 0,
  name: 'Current Person',
  imageUrl: 'assets/images/Avator 6.png'
);

final Person person1 = Person(
    id: 1,
    name: 'Person1',
    imageUrl: 'assets/images/Avator 6.png'
);

final Person person2 = Person(
    id: 2,
    name: 'Person2',
    imageUrl: 'assets/images/Avator 6.png'
);

final Person person3 = Person(
    id: 3,
    name: 'Person3',
    imageUrl: 'assets/images/Avator 17.png'
);

final Person person4 = Person(
    id: 4,
    name: 'Person4',
    imageUrl: 'assets/images/Avator 6.png'
);

final Person person5 = Person(
    id: 5,
    name: 'Person5',
    imageUrl: 'assets/images/Avator 17.png'
);

final Person person6 = Person(
    id: 6,
    name: 'Person6',
    imageUrl: 'assets/images/Avator 6.png'
);

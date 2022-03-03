
import '../widgets/drop_down_title.dart';

class Clinic implements DropDownItem  {
  final String? id;
  final String? name;
  final String? location;
  final String? distance;
  final String? gravity;
  final String? description;
  final String? image;

  const Clinic({this.id, this.name, this.location, this.distance, this.gravity,
    this.description, this.image});

  @override
  String getDropDownItemText(bool isArabicLang) {
      return (name) ?? "";

  }
}

List<Clinic> clinics = [
  const Clinic(
    id: "1",
    name: "Clinic One",
    location: "Cairo",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Lorem ipsum...",
    image: "assets/img/mars.png",
  ),
  const Clinic(
    id: "2",
    name: "Clinic two",
    location: "Giza",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Lorem ipsum...",
    image: "assets/img/neptune.png",
  ),
  const Clinic(
    id: "3",
    name: "Clinic three",
    location: "Giza",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Lorem ipsum...",
    image: "assets/img/moon.png",
  ),
  const Clinic(
    id: "4",
    name: "Clinic fourth",
    location: "Cairo",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Lorem ipsum...",
    image: "assets/img/earth.png",
  ),
  const Clinic(
    id: "5",
    name: "Clinic five",
    location: "Cairo",
    distance: "54.6m Km",
    gravity: "3.711 m/s ",
    description: "Lorem ipsum...",
    image: "assets/img/mercury.png",
  ),
];
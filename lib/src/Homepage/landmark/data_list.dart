import 'package:flutter/material.dart';

class Item {
  String name;
  String description;
  String image;
  String locati;
  Item(this.name, this.description, this.image, this.locati);
}

List<Item> items = [
  Item(
      'LandMark: Al-Fateh Grand Mousqe',
      "Is one of the largest mosques in the world, The mosque was built by the late Sheikh Isa ibn Salman Al Khalifa in 1987 and was named after Ahmed Al Fateh, the founder of Bahrain. In 2006, Al-Fateh became the site of the National Library of Bahrain. The mosque is the largest place of worship in Bahrain.",
      'images/BH/AlFatehGrand.jpeg',
      'https://goo.gl/maps/CgTDTbMkuxL1ttGDA'),
  Item(
      'LandMark: Alkhamis Mousqe',
      "Built around 692 AD, Al Khamis Mosque is one of the oldest mosques in the Arab world. The identical twin minarets on this ancient Islamic monument make it easily recognizable. The foundation dates back to the 11th century and has been rebuilt in the 14th and 15th centuries. During this reconstruction the twin minarets were added.",
      'images/BH/Alkhamis.jpeg',
      'https://goo.gl/maps/hUrVFYPFEf6w2tCa9'),
  Item(
      'LandMark: Bahrain Fort',
      "Located in the area of Seef and previously known as Portugal Port, the Bahrain Fort or Qal’at al-Bahrain is built over 180,000 sq ft. Occupation of the fort has been recorded from 2300BC to the 16th Century. The fort is named for the Qal’at al-Burtughal and was located at the capital of the Dilmun civilization.",
      'images/BH/BahrainFort.jpeg',
      'https://goo.gl/maps/vkDm6LenoqM2RdTh7'),
  Item(
      'LandMark: Bahrain International Circuit',
      "Located in the heart of the Sakhir desert, Bahrain International Circuit is a unique and contemporary sports and entertainment venue that is synonymous with the highest levels of global motorsport. Featuring five different track layouts, the circuit first saw life in 2004 when the first ever Formula 1 Grand Prix took place in the country, making it the first-ever track in the Middle East to host the Formula 1 World Championship.",
      'images/BH/BahrainInternationalCircuit.jpeg',
      'https://goo.gl/maps/8WhjL1i3rtojrp6m7'),
];

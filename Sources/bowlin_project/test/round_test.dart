import 'package:bowl_in/model/LastRound.dart';
import 'package:bowl_in/model/Round.dart';
import 'package:bowl_in/model/Stat.dart';
import 'package:bowl_in/model/User.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test("Test Round", (){
    User u =  User(1, "Louison" , "Sources/bowlin_project/assets/images/image_user_pink.png", "loparant@gmail.com", [], []);
    Round r = Round(null, null, null, u, 1);

    expect(r.getMaxPinsThisShot(), 10);
    expect(r.isSpareOrStrike(), false);

    r.computeNext(4);

    expect(r.getMaxPinsThisShot(), 6);
    r.computeNext(6);


    expect(r.isSpare(), true);
    expect(r.isSpareOrStrike(), true);
    expect(r.isStrike(), false);
    expect(r.getNbSpares(), 1);
    expect(r.getNbStrike(), 0);

    Round r2 = Round(null, null, null, u, 2);
    r2.computeNext(10);
    expect(r2.isSpare(), false);
    expect(r2.isStrike(), true);
    expect(r2.isSpareOrStrike(), true);
    expect(r2.getNbSpares(), 0);
    expect(r2.getNbStrike(), 1);

    Round r3 = Round(null, null, null, u, 2);
    r3.computeNext(2);
    r3.computeNext(5);
    expect(r3.getPinsKnockedDown(), 7);
  });

  test("Test LastRound", (){
    User u =  User(1, "Louison" , "Sources/bowlin_project/assets/images/image_user_pink.png", "loparant@gmail.com", [], []);
    LastRound r = LastRound(null, null, null, u, 1, null);

    expect(r.getMaxPinsThisShot(), 10);
    expect(r.isSpareOrStrike(), false);
    r.computeNext(10);

    expect(r.getMaxPinsThisShot(), 10);
    r.computeNext(10);

    expect(r.getMaxPinsThisShot(), 10);
    r.computeNext(10);

    expect(r.getPinsKnockedDown(), 30);
    expect(r.getNbSpares(), 0);
    expect(r.getNbStrike(), 3);

    LastRound r2 = LastRound(null, null, null, u, 1, null);
    r2.computeNext(1);
    expect(r2.getMaxPinsThisShot(), 9);
    r2.computeNext(9);
    expect(r2.getMaxPinsThisShot(), 10);
    r2.computeNext(10);
    expect(r2.getPinsKnockedDown(), 20);
    expect(r2.getNbSpares(), 1);
    expect(r2.getNbStrike(), 1);

    LastRound r3 = LastRound(null, null, null, u, 1, null);
    r3.computeNext(10);
    r3.computeNext(2);
    expect(r3.getMaxPinsThisShot(), 8);
    r3.computeNext(8);
    expect(r3.getPinsKnockedDown(), 20);
    expect(r3.getNbSpares(), 1);
    expect(r3.getNbStrike(), 1);

  });
}
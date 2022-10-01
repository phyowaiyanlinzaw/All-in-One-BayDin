import 'package:flutter/material.dart';

class LoveCalculator{
	String loveCalculator(String firstPersonName,String secondPersonName){
		List firstPersonNameInLower = [firstPersonName.replaceAll(" ", '').toLowerCase()];
		List secondPersonNameInLower = [secondPersonName.replaceAll(" ", '').toLowerCase()];

		List totalNameArray = [firstPersonNameInLower+secondPersonNameInLower];

		var namesMap = Map();

		totalNameArray.forEach((x) {
			if(!namesMap.containsKey(x)) {
      			namesMap[x] = 1;
    		} else {
      			namesMap[x] += 1;
    		}
  			}
		);

		var numCountedList = [
			namesMap.values
		];

		

		return "";
	}
}
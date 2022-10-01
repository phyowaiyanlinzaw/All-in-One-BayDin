class PersonTypeAnalyzer {
  String getPersonType(String? name) {
    var initialsAndNumbers = {
      1: ["အ", "ဥ"],
      2: ["က", "ခ", "ဂ", "ဃ", "င"],
      3: ["စ", "ဆ", "ဇ", "ဈ", "ည"],
      4: ["ယ", "လ", "ဝ", "၀"],
      5: ["ပ", "ဖ", "ဗ", "ဘ", "မ"],
      6: ["သ", "ဟ"],
      7: ["တ", "ထ", "ဒ", "ဓ", "န"],
      8: ["ရ"]
    };
    var sum = 0;
    List splittedNameArray = name!.split('');

    for (var i in initialsAndNumbers.keys) {
      for (var j in splittedNameArray) {
        for (var k in initialsAndNumbers[i]!) {
          if (j == k) {
            sum = sum + i;
          }
        }
      }
    }
    var remainder = (sum + 7) % 9;

    if (remainder == 1) {
      return "သူဆင်းရဲကိန်း (မိမိကြိုးစားသလောက် မခံစားရသူ)";
    } else if (remainder == 2) {
      return "သူဌေးကိန်း (ငွေသုံးကြမ်းသူ၊ အမြဲငွေပြတ်နေတတ်ပြီး အမှန်တကယ် အသုံးလိုချိန်တွင်လည်း ရရှိတတ်သူ)";
    } else if (remainder == 3) {
      return "သူခိုးကိန်း";
    } else if (remainder == 4) {
      return "မင်းကိန်း (ဩဇာရှိသူ၊ ထက်မြတ်သူ)";
    } else if (remainder == 5) {
      return "မိဖုရားကိန်း (ကြီးမြတ်သူ ပံ့ပိုးမှုဖြင့် အောင်မြင်သူ)";
    } else if (remainder == 6) {
      return "ဘီလူးကိန်း (ကြမ်းတမ်းသူ၊ ဘဝအတက်အကျမြန်သူ)";
    } else if (remainder == 7) {
      return "အမတ်ကိန်း (မျှတသူ၊ အပေါင်းအသင်းများအား အကြံဉာဏ်ကောင်းပေးတတ်သူ)";
    } else if (remainder == 8) {
      return "ပုဏ္ဏားကိန်း (အတ္တကြီးသူ၊ တစ်ကိုယ်ကောင်းဆန်သူ၊ မိမိကောင်းကျိုးအတွက် မည်သူ့ကိုမျှ မငဲ့ကွက်သူ)";
    } else if (remainder == 0) {
      return "ရဟန်းကိန်း (အကောင်းဆုံး ပုဂ္ဂိုလ်)";
    }
    throw 'L Person';
  }
}

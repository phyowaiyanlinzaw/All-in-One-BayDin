import 'dart:math';

class AnswerRandomizer {
  String answerRandomizer() {
    List answers = [
      'သေချာတာပေါ့',
      'ထပ်မေးကြည့်ပါ',
      'မျှော်လင့်မထားတာ ပိုကောင်းမယ်',
      'ဖြစ်ဖို့ သေချာပါတယ်',
      'ခဏနေမှ ပြန်မေးပါ',
      'အန်ကယ်ကတော့ နိုးပါ',
      'ခြွင်းချက်မရှိ ဖြစ်နိုင်တယ်',
      'အခု ချက်ချင်း ပြောမရဘူး',
      'မဖြစ်နိုင်ပါ',
      'အသေချာဆုံးပဲ',
      'လောလောဆယ် မခန့်မှန်းနိုင်ပါ',
      'အခြေအနေ သိပ်မဟန်ဘူး',
      'မျှော်လင့်ကြည့်ပါ',
      'အာရုံစိုက်ပြီး ထပ်မေးပါ',
      'မရေရာမှုတွေ များနေတယ်',
      'ဖြစ်နိုင်ချေ များတယ်',
      'ဖြစ်ကို ဖြစ်မှာ',
      'အခြေအနေ ကောင်းတယ်',
      'ရက်စ်',
      'ရက်စ် ရက်စ် ရက်စ်'
    ];

    String result = answers[Random().nextInt(answers.length)];

    return result;
  }
}

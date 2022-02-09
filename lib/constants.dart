import 'package:flutter/material.dart';

import 'models/question_model.dart';
import 'models/quiz_model.dart';

const kPrimaryColor = Color(0xFF54BAB9);
const kBackgroundColor = Color(0xFFC1DEAE);
const kPageContentPadding = EdgeInsets.all(15.0);
const kAppTitleStyle = TextStyle(color: Colors.white, fontSize: 37);
const kSubHeaderStyle = TextStyle(color: Colors.white, fontSize: 20);
const kInputTextColor = Colors.black45;
const kInputTextSize = 16.0;
const kIconSize = 27.0;
const kHintTextStyle = TextStyle(color: Colors.white60, fontSize: 16);
const kLabelTextStyle = TextStyle(color: Colors.white);
const kOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Color(0xFF54BAB9)),
  borderRadius: BorderRadius.all(Radius.circular(15.0)),
);
const kFocusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.red),
  borderRadius: BorderRadius.all(Radius.circular(15.0)),
);
const kLeveles = ["A1", "A2", "B1", "B2", "C1", "C2"];
const kSkills = ["Grammar", "Reading", "Vocabulary", "Writting"];

final quizes = [
  Quiz(
      title: "Modal Verbs",
      author: "Ali Alsaeed",
      level: "B1",
      skill: "Grammar",
      durationForQuestion: 30,
      questions: [
        Question(
          id: 1,
          question:
              "I wanted to make a cup of coffee, but I was pissed off. We had _____ coffee. ",
          answer: 2,
          options: ['a few', 'few', 'a little', 'little'],
        ),
        Question(
          id: 2,
          question: "I have too _____ time for my family. I am always busy.",
          answer: 1,
          options: ['a few', 'few', 'a little', 'little'],
        ),
        Question(
          id: 3,
          question:
              "Very _____ people came to his party. He was really angry and disappointed.",
          answer: 2,
          options: ['a few', 'few', 'little', 'a little'],
        ),
        Question(
          id: 4,
          question:
              "Although I am busy all the time, I always try to find _____ time for my kids",
          answer: 1,
          options: ['a few', 'few', 'a little', 'litle'],
        ),
        Question(
          id: 5,
          question:
              "I am still new to this city, but I am really glad I made _____ friends.",
          answer: 3,
          options: ['a few', 'few', 'a little', 'little'],
        ),
        Question(
          id: 6,
          question: "A new tax that is thought _____ protests _____ soon.",
          answer: 2,
          options: [
            'to cause / will be introduced',
            'to have caused / have been introduced',
            'to be causing / is introduced',
            'to have caused / are introduced'
          ],
        ),
        Question(
          id: 7,
          question: "Your proposals deserve _____ in detail.",
          answer: 3,
          options: [
            'to consider',
            'considered',
            'to be considered',
            'to be considering'
          ],
        ),
        Question(
          id: 8,
          question: "hello",
          answer: 3,
          options: ['hello', 'hi', 'hola', 'Suiiiiiiiiiiii'],
        ),
        Question(
          id: 9,
          question:
              "_____ wants to expose _____. People often hide their feelings. ",
          answer: 2,
          options: [
            'everybody / themselves',
            'anyone / himself',
            'nobody / themselves',
            'somebody / himself'
          ],
        ),
        Question(
          id: 10,
          question:
              "Strawberries are _____ cheap at the moment _____ we should make some jam.",
          answer: 1,
          options: [
            'more / than',
            'not only / but also',
            'so / that',
            'both /and'
          ],
        ),
      ]),
  Quiz(
      title: "Medical Words",
      author: "Batool Alsaeed",
      level: "C1",
      skill: "Vocabulary",
      durationForQuestion: 15,
      questions: [
        Question(
          id: 1,
          question:
              "Hello aloosh I wanted to make a cup of coffee, but I was pissed off. We had _____ coffee. ",
          answer: 2,
          options: ['a few', 'few', 'a little', 'little'],
        ),
        Question(
          id: 2,
          question: "I have too _____ time for my family. I am always busy.",
          answer: 1,
          options: ['a few', 'few', 'a little', 'little'],
        ),
        Question(
          id: 3,
          question:
              "Very _____ people came to his party. He was really angry and disappointed.",
          answer: 2,
          options: ['a few', 'few', 'little', 'a little'],
        ),
        Question(
          id: 4,
          question:
              "Although I am busy all the time, I always try to find _____ time for my kids",
          answer: 1,
          options: ['a few', 'few', 'a little', 'litle'],
        ),
        Question(
          id: 5,
          question:
              "I am still new to this city, but I am really glad I made _____ friends.",
          answer: 3,
          options: ['a few', 'few', 'a little', 'little'],
        ),
        Question(
          id: 6,
          question: "A new tax that is thought _____ protests _____ soon.",
          answer: 2,
          options: [
            'to cause / will be introduced',
            'to have caused / have been introduced',
            'to be causing / is introduced',
            'to have caused / are introduced'
          ],
        ),
        Question(
          id: 7,
          question: "Your proposals deserve _____ in detail.",
          answer: 3,
          options: [
            'to consider',
            'considered',
            'to be considered',
            'to be considering'
          ],
        ),
        Question(
          id: 8,
          question: "hello",
          answer: 3,
          options: ['hello', 'hi', 'hola', 'Suiiiiiiiiiiii'],
        ),
        Question(
          id: 9,
          question:
              "_____ wants to expose _____. People often hide their feelings. ",
          answer: 2,
          options: [
            'everybody / themselves',
            'anyone / himself',
            'nobody / themselves',
            'somebody / himself'
          ],
        ),
        Question(
          id: 10,
          question:
              "Strawberries are _____ cheap at the moment _____ we should make some jam.",
          answer: 1,
          options: [
            'more / than',
            'not only / but also',
            'so / that',
            'both /and'
          ],
        ),
      ]),
  Quiz(
    title: "Past Perfect",
    author: "Zeinab Alsaeed",
    level: "B1",
    skill: "Grammar",
    durationForQuestion: 15,
    questions: [
      Question(
        id: 1,
        question:
            "I wanted to make a cup of coffee, but I was pissed off. We had _____ coffee. ",
        answer: 2,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 2,
        question: "I have too _____ time for my family. I am always busy.",
        answer: 1,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 3,
        question:
            "Very _____ people came to his party. He was really angry and disappointed.",
        answer: 2,
        options: ['a few', 'few', 'little', 'a little'],
      ),
      Question(
        id: 4,
        question:
            "Although I am busy all the time, I always try to find _____ time for my kids",
        answer: 1,
        options: ['a few', 'few', 'a little', 'litle'],
      ),
      Question(
        id: 5,
        question:
            "I am still new to this city, but I am really glad I made _____ friends.",
        answer: 3,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 6,
        question: "A new tax that is thought _____ protests _____ soon.",
        answer: 2,
        options: [
          'to cause / will be introduced',
          'to have caused / have been introduced',
          'to be causing / is introduced',
          'to have caused / are introduced'
        ],
      ),
      Question(
        id: 7,
        question: "Your proposals deserve _____ in detail.",
        answer: 3,
        options: [
          'to consider',
          'considered',
          'to be considered',
          'to be considering'
        ],
      ),
      Question(
        id: 8,
        question: "hello",
        answer: 3,
        options: ['hello', 'hi', 'hola', 'Suiiiiiiiiiiii'],
      ),
      Question(
        id: 9,
        question:
            "_____ wants to expose _____. People often hide their feelings. ",
        answer: 2,
        options: [
          'everybody / themselves',
          'anyone / himself',
          'nobody / themselves',
          'somebody / himself'
        ],
      ),
      Question(
        id: 10,
        question:
            "Strawberries are _____ cheap at the moment _____ we should make some jam.",
        answer: 1,
        options: [
          'more / than',
          'not only / but also',
          'so / that',
          'both /and'
        ],
      )
    ],
  ),
  Quiz(
    title: "Conditonal Statements",
    author: "Hasan Alsaeed",
    level: "B1",
    skill: "Grammar",
    durationForQuestion: 20,
    questions: [
      Question(
        id: 1,
        question:
            "I wanted to make a cup of coffee, but I was pissed off. We had _____ coffee. ",
        answer: 2,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 2,
        question: "I have too _____ time for my family. I am always busy.",
        answer: 1,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 3,
        question:
            "Very _____ people came to his party. He was really angry and disappointed.",
        answer: 2,
        options: ['a few', 'few', 'little', 'a little'],
      ),
      Question(
        id: 4,
        question:
            "Although I am busy all the time, I always try to find _____ time for my kids",
        answer: 1,
        options: ['a few', 'few', 'a little', 'litle'],
      ),
      Question(
        id: 5,
        question:
            "I am still new to this city, but I am really glad I made _____ friends.",
        answer: 3,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 6,
        question: "A new tax that is thought _____ protests _____ soon.",
        answer: 2,
        options: [
          'to cause / will be introduced',
          'to have caused / have been introduced',
          'to be causing / is introduced',
          'to have caused / are introduced'
        ],
      ),
      Question(
        id: 7,
        question: "Your proposals deserve _____ in detail.",
        answer: 3,
        options: [
          'to consider',
          'considered',
          'to be considered',
          'to be considering'
        ],
      ),
      Question(
        id: 8,
        question: "hello",
        answer: 3,
        options: ['hello', 'hi', 'hola', 'Suiiiiiiiiiiii'],
      ),
      Question(
        id: 9,
        question:
            "_____ wants to expose _____. People often hide their feelings. ",
        answer: 2,
        options: [
          'everybody / themselves',
          'anyone / himself',
          'nobody / themselves',
          'somebody / himself'
        ],
      ),
      Question(
        id: 10,
        question:
            "Strawberries are _____ cheap at the moment _____ we should make some jam.",
        answer: 1,
        options: [
          'more / than',
          'not only / but also',
          'so / that',
          'both /and'
        ],
      )
    ],
  ),
  Quiz(
    title: "Quesion Tag",
    author: "Hanan Alsaleh",
    level: "B1",
    skill: "Grammar",
    durationForQuestion: 20,
    questions: [
      Question(
        id: 1,
        question:
            "I wanted to make a cup of coffee, but I was pissed off. We had _____ coffee. ",
        answer: 2,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 2,
        question: "I have too _____ time for my family. I am always busy.",
        answer: 1,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 3,
        question:
            "Very _____ people came to his party. He was really angry and disappointed.",
        answer: 2,
        options: ['a few', 'few', 'little', 'a little'],
      ),
      Question(
        id: 4,
        question:
            "Although I am busy all the time, I always try to find _____ time for my kids",
        answer: 1,
        options: ['a few', 'few', 'a little', 'litle'],
      ),
      Question(
        id: 5,
        question:
            "I am still new to this city, but I am really glad I made _____ friends.",
        answer: 3,
        options: ['a few', 'few', 'a little', 'little'],
      ),
      Question(
        id: 6,
        question: "A new tax that is thought _____ protests _____ soon.",
        answer: 2,
        options: [
          'to cause / will be introduced',
          'to have caused / have been introduced',
          'to be causing / is introduced',
          'to have caused / are introduced'
        ],
      ),
      Question(
        id: 7,
        question: "Your proposals deserve _____ in detail.",
        answer: 3,
        options: [
          'to consider',
          'considered',
          'to be considered',
          'to be considering'
        ],
      ),
      Question(
        id: 8,
        question: "hello",
        answer: 3,
        options: ['hello', 'hi', 'hola', 'Suiiiiiiiiiiii'],
      ),
      Question(
        id: 9,
        question:
            "_____ wants to expose _____. People often hide their feelings. ",
        answer: 2,
        options: [
          'everybody / themselves',
          'anyone / himself',
          'nobody / themselves',
          'somebody / himself'
        ],
      ),
      Question(
        id: 10,
        question:
            "Strawberries are _____ cheap at the moment _____ we should make some jam.",
        answer: 1,
        options: [
          'more / than',
          'not only / but also',
          'so / that',
          'both /and'
        ],
      )
    ],
  ),
];

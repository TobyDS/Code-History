//
//  ContentView.swift
//  Code History
//
//  Created by Toby Dixon Smith on 25/06/2024.
//

import SwiftUI

struct GameView: View {
    
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2
    )
    
    @State var mainColor = GameColor.main
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack {
                Text("1 / 10")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack {
                    ForEach(0..<question.possibleAnswers.count, id: \.self) { answerIndex in
                        Button(action: {
                            print(
                                "Tapped on an option with the text: \(question.possibleAnswers[answerIndex])"
                            )
                            mainColor = answerIndex == question.correctAnswerIndex ? GameColor.correctGuess : GameColor.incorrectGuess
                        }, label: {
                            ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                        })
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    GameView()
}

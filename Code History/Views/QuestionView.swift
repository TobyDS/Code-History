//
//  QuestionView.swift
//  Code History
//
//  Created by Toby Dixon Smith on 29/06/2024.
//

import SwiftUI

struct QuestionView: View {

  @EnvironmentObject var viewModel: GameViewModel
  let question: Question

  var body: some View {
    VStack {
      Text(question.questionText)
        .font(.largeTitle)
        .bold()
        .multilineTextAlignment(.leading)
      Spacer()
      HStack {
        ForEach(0..<question.possibleAnswers.count, id: \.self) { answerIndex in
          Button(action: {
            print(
              "Tapped on option with the text: \(question.possibleAnswers[answerIndex])"
            )
            viewModel.makeGuess(atIndex: answerIndex)
          }) {
            ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
              .background(viewModel.color(forOptionIndex: answerIndex))
          }
          .disabled(viewModel.guessWasMade)
        }
      }
      if viewModel.guessWasMade {
        Button(action: {
          viewModel.displayNextScreen()
        }) {
          BottomTextView(str: "Next")
        }
      }
    }
  }
}

#Preview {
  QuestionView(question: Game().currentQuestion)
}

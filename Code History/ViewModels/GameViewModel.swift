//
//  GameViewModel.swift
//  Code History
//
//  Created by Toby Dixon Smith on 29/06/2024.
//

import SwiftUI

class GameViewModel: ObservableObject {
  @Published private var game = Game()

  var currentQuestion: Question {
    game.currentQuestion
  }

  var questionProgressText: String {
    "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
  }

  var guessWasMade: Bool {
    if game.guesses[currentQuestion] != nil {
      return true
    } else {
      return false
    }
  }

  func makeGuess(atIndex index: Int) {
    game.makeGuessForCurrentQuestion(atIndex: index)
  }

  func displayNextScreen() {
    game.updateGameStatus()
  }

  func color(forOptionIndex optionIndex: Int) -> Color {
    if let guessedIndex = game.guesses[currentQuestion] {
      if guessedIndex != optionIndex {
        return GameColor.main
      } else if guessedIndex == currentQuestion.correctAnswerIndex {
        return GameColor.correctGuess
      } else {
        return GameColor.incorrectGuess
      }
    } else {
      return GameColor.main
    }
  }
}

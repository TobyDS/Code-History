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
    if let _ = game.guesses[currentQuestion] {
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
}

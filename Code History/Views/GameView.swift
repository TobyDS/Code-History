//
//  ContentView.swift
//  Code History
//
//  Created by Toby Dixon Smith on 25/06/2024.
//

import SwiftUI

struct GameView: View {

  @StateObject var viewModel = GameViewModel()

  var body: some View {
    ZStack {
      GameColor.main.ignoresSafeArea()
      VStack {
        Text(viewModel.questionProgressText)
          .font(.callout)
          .multilineTextAlignment(.leading)
          .padding()
        QuestionView(question: viewModel.currentQuestion)
      }
    }
    .foregroundColor(.white)
    .navigationBarHidden(true)
    .environmentObject(viewModel)
  }
}

#Preview {
  GameView()
}

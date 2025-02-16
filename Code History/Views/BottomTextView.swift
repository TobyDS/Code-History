//
//  BottomTextView.swift
//  Code History
//
//  Created by Toby Dixon Smith on 29/06/2024.
//

import SwiftUI

struct BottomTextView: View {
  let str: String

  var body: some View {
    HStack {
      Spacer()
      Text(str)
        .font(.body)
        .bold()
        .padding()
      Spacer()
    }.background(GameColor.accent)
  }
}

#Preview {
  BottomTextView(str: "Test")
}

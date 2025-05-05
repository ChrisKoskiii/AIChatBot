//
//  OnboardingCompletedView.swift
//  AIChatCourse
//
//  Created by Christopher Koski on 5/5/25.
//

import SwiftUI

struct OnboardingCompletedView: View {
  
  @Environment(AppState.self) private var root
  
    var body: some View {
      VStack {
        Text("Onboarding completed!")
          .frame(maxHeight: .infinity)
        Button {
          onFinishButtonPressed()
        } label: {
          Text("Get started")
            .callToActionButton()
        }
      }
      .padding(16)
    }
  
  func onFinishButtonPressed() {
    root.updateViewState(showTabbarView: true)
  }
}

#Preview {
    OnboardingCompletedView()
    .environment(AppState())
}

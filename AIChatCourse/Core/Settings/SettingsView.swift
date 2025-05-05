//
//  SettingsView.swift
//  AIChatCourse
//
//  Created by Christopher Koski on 5/5/25.
//

import SwiftUI

struct SettingsView: View {
  
  @Environment(\.dismiss) private var dismiss
  @Environment(AppState.self) private var appState
  
    var body: some View {
      NavigationStack {
        List {
          Button {
           onSignOutPressed()
          } label: {
            Text("Sign out")
          }
        }
        .navigationTitle("Settings")
      }
    }
  
  func onSignOutPressed() {
    Task { @MainActor in
      dismiss()
      try? await Task.sleep(for: .seconds(1))
      appState.updateViewState(showTabbarView: false)
    }
  }
}

#Preview {
    SettingsView()
}

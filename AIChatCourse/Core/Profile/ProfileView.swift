//
//  ProfileVIEW.swift
//  AIChatCourse
//
//  Created by Christopher Koski on 5/5/25.
//

import SwiftUI

struct ProfileView: View {
  
  @State private var showSettingsView: Bool = false
  
    var body: some View {
      NavigationStack {
        Text("Profile")
          .navigationTitle("Profile")
          .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
              settingButton
            }
          }
      }
      .sheet(isPresented: $showSettingsView) {
        Text("SettingsView")
      }
    }
  
  private var settingButton: some View {
    Button {
      onSettingsButtonPressed()
    } label: {
      Image(systemName: "gear")
    }
  }
  
  private func onSettingsButtonPressed() {
    showSettingsView = true
  }
}

#Preview {
    ProfileView()
}

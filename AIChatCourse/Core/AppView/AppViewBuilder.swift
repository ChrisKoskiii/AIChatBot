//
//  AppViewBuilder.swift
//  AIChatCourse
//
//  Created by Christopher Koski on 5/4/25.
//

import SwiftUI

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
  
  var showTabBar: Bool = false
  @ViewBuilder var tabbarView: TabbarView
  @ViewBuilder var onboardingView: OnboardingView
  
  var body: some View {
    ZStack {
      if showTabBar {
        tabbarView
        .transition(.move(edge: .trailing))
      } else {
        onboardingView
        .transition(.move(edge: .leading))
      }
    }
    .animation(.smooth, value: showTabBar)
  }
}

private struct PreviewView: View {
  
  @State private var showTabBar: Bool = true
  
  var body: some View {
    AppViewBuilder(
      showTabBar: showTabBar,
      tabbarView: {
        ZStack {
          Color.red.ignoresSafeArea()
          Text("Tabbar")
        }
      },
      onboardingView: {
        ZStack {
          Color.blue.ignoresSafeArea()
          Text("Onboarding")
        }
      }
    )
    .onTapGesture {
      showTabBar.toggle()
    }
  }
}

#Preview {
  PreviewView()
}

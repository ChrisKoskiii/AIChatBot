//
//  AppState.swift
//  AIChatCourse
//
//  Created by Christopher Koski on 5/5/25.
//

import SwiftUI

@Observable
class AppState {
  private(set) var showTabBar: Bool {
    didSet {
      UserDefaults.showTabbarView = showTabBar
    }
  }
  
  init(showTabBar: Bool = UserDefaults.showTabbarView) {
    self.showTabBar = showTabBar
  }
  
  func updateViewState(showTabbarView: Bool) {
    showTabBar = showTabbarView
  }
}

extension UserDefaults {
  
  private struct Keys {
    static let showTabbarView = "showTabbarView"
  }
  
  static var showTabbarView: Bool {
    get {
      standard.bool(forKey: Keys.showTabbarView)
    }
    set {
      standard.set(newValue, forKey: Keys.showTabbarView)
    }
  }
}

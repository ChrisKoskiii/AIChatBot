//
//  ExploreView.swift
//  AIChatCourse
//
//  Created by Christopher Koski on 5/5/25.
//

import SwiftUI

struct ExploreView: View {
  
  @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
  @State private var categories: [CharacterOption] = CharacterOption.allCases
  
  var body: some View {
    NavigationStack {
      List {
        featuredSection
        
        categorySection
      }
      .navigationTitle("Explore")
    }
  }
  
  private var featuredSection: some View {
    Section {
      ZStack {
        CarouselView(items: featuredAvatars) { item in
          HeroCellView(
            title: item.name,
            subtitle: item.characterDescription,
            imageName: item.profileImageName
          )
        }
      }
      .removeListRowFormatting()
    } header: {
      Text("Featured Avatars")
    }
  }
  
  private var categorySection: some View {
    Section {
      ZStack {
        ScrollView(.horizontal) {
          HStack(spacing: 12) {
            ForEach(categories, id:\.self) { category in
              CategoryCellView(title: category.rawValue.capitalized)
            }
          }
        }
        .frame(height: 140)
        .scrollIndicators(.hidden)
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
      }
      .removeListRowFormatting()
    } header: {
      Text("Categories")
    }
  }
}

#Preview {
  ExploreView()
}

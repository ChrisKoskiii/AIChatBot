//
//  AvatarModel.swift
//  AIChatCourse
//
//  Created by Christopher Koski on 5/13/25.
//

import Foundation

struct AvatarModel {
  
  let avatarId: String
  let name: String?
  let characterOption: CharacterOption?
  let characterAction: CharacterAction?
  let location: CharacterLocation?
  let profileImageName: String?
  let authorId: String?
  let dateCreated: Date?
  
  init(
    avatarId: String,
    name: String? = nil,
    characterOption: CharacterOption? = nil,
    characterAction: CharacterAction? = nil,
    location: CharacterLocation? = nil,
    profileImageName: String? = nil,
    authorId: String? = nil,
    dateCreated: Date? = nil
  ) {
    self.avatarId = avatarId
    self.name = name
    self.characterOption = characterOption
    self.characterAction = characterAction
    self.location = location
    self.profileImageName = profileImageName
    self.authorId = authorId
    self.dateCreated = dateCreated
  }
  
  var characterDescription: String {
    AvatarDescriptionBuilder(avatar: self).characterDescription
  }
  
  static var mock: AvatarModel {
    mocks[0]
  }
  static var mocks: [AvatarModel] {
    [
      AvatarModel(avatarId: UUID().uuidString, name: "Moe", characterOption: .alien, characterAction: .crying, location: .beach, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
      AvatarModel(avatarId: UUID().uuidString, name: "John", characterOption: .dog, characterAction: .eating, location: .mountains, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
      AvatarModel(avatarId: UUID().uuidString, name: "Larry", characterOption: .cat, characterAction: .relaxing, location: .museum, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
      AvatarModel(avatarId: UUID().uuidString, name: "Qwerty", characterOption: .women, characterAction: .fighting, location: .space, profileImageName: Constants.randomImage, authorId: UUID().uuidString, dateCreated: .now),
    ]
  }
}

struct AvatarDescriptionBuilder {
  let characterOption: CharacterOption
  let characterAction: CharacterAction
  let location: CharacterLocation
  
  init(characterOption: CharacterOption, characterAction: CharacterAction, location: CharacterLocation) {
    self.characterOption = characterOption
    self.characterAction = characterAction
    self.location = location
  }
  
  init(avatar: AvatarModel) {
    self.characterOption = avatar.characterOption ?? .default
    self.characterAction = avatar.characterAction ?? .default
    self.location = avatar.location ?? .default
  }
  
  var characterDescription: String {
    "A \(characterOption.rawValue) that is \(characterAction.rawValue) in the \(location)"
  }
}

enum CharacterOption: String {
  case man, women, alien, dog, cat
  
  static var `default`: Self {
    .man
  }
}

enum CharacterAction: String {
  case smiling, eating, drinking, shopping, studying, fighting, working, relaxing, crying
  
  static var `default`: Self {
    .smiling
  }
}

enum CharacterLocation: String {
  case museum, desert, space, forest, city, beach, mountains
  
  static var `default`: Self {
    .city
  }
}



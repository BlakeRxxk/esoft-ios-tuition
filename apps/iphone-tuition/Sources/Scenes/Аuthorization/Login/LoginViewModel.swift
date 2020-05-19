//
//  LoginViewModel.swift
//  AppLibrary
//
//  Created by nedstar on 19.05.2020.
//

import IGListKit

class LoginViewModel: ListDiffable {
  var id: Int
  let keyboardHeight: CGFloat?
  
  init(id: Int,
       keyboardHeight: CGFloat?) {
    self.id = id
    self.keyboardHeight = keyboardHeight
  }
  
  func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    true
  }
}

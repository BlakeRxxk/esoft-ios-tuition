//
//  AuthCityView+Style.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Atlas

extension AuthCityView {
  public enum Styles {
    public static let `default` = Style(name: "specialist.item.view.default") { (item: AuthCityView) in
      item.isComingSoon = false
    }
    
    public static let comingSoon = Style(name: "specialist.item.view.with.action") { (item: AuthCityView) in
      item.isComingSoon = true
    }
  }
}

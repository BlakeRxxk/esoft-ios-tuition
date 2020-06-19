//
//  EditSellerPriceItemView.swift
//  EsoftUIKit
//
//  Created by wtildestar on 17/06/2020.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager
import YogaKit

public final class EditSellerPriceItemView: View {
  public var currentPrice1: UITextField {
    get {
      currentPrice
    }
    set {
      currentPrice = newValue
    }
  }
  
  private(set) lazy var mainContainer: UIView = UIView()
  private(set) lazy var currentPrice: UITextField = UITextField()
  private(set) lazy var recomendedPrice: UITextField = UITextField()
  private(set) lazy var newPrice: UITextField = UITextField()
  
  override public init() {
    super.init()
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    
    
    addSubview <^> [
      mainContainer
    ]
  }
  
  private func configureUI() {
    
  }
  
  private func layout() {
    
  }
}

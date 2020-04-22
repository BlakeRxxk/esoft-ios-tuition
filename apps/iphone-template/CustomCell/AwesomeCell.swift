//
//  AwesomeCell.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 22.04.2020.
//

import UIKit
import YogaKit
import EsoftUIKit

final class AwesomeCell: UICollectionViewCell {
  public static let reuseIdentifier: String = "AwesomeCellID"
  
  lazy var textLabel: UILabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    textLabel.styledText = ""
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    textLabel.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 24
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func createUI() {
    contentView.addSubview(textLabel)
  }
  
  private func configureUI() {
    textLabel.setStyles(UILabel.Styles.regular)
  }
}

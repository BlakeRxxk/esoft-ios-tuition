//
//  ObjectCell.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 08.05.2020.
//

import Foundation
import EsoftUIKit
import YogaKit

public final class ObjectCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "ObjectCellID"
  
  private(set) lazy var container: UIView = UIView()
  private(set) lazy var previewItemViewYOGA: PreviewItemViewYOGA = PreviewItemViewYOGA()
  private(set) lazy var addressItemViewYOGA: AddressItemViewYOGA = AddressItemViewYOGA()
  private(set) lazy var infoItemView: InfoItemViewYOGA = InfoItemViewYOGA()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func prepareForReuse() {
    super.prepareForReuse()

    // previewItemView
    previewItemViewYOGA.address = ""
    previewItemViewYOGA.currentPrice = ""
    previewItemViewYOGA.price = ""
    previewItemViewYOGA.photo = UIImage()
    
    // addressItemView
    addressItemViewYOGA.title = ""
    
    // infoItemView
    infoItemView.firstTitle = ""
    infoItemView.secondTitle = ""
    infoItemView.thirdTitle = ""
  }
  
  private func createUI() {
    container.addSubview(previewItemViewYOGA)
    container.addSubview(addressItemViewYOGA)
    container.addSubview(infoItemView)
    contentView.addSubview(container)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    
      contentView.configureLayout { layout in
        layout.isEnabled = true
        layout.width = 100%
        layout.height = 100%
      }

      container.configureLayout { layout in
        layout.isEnabled = true
        layout.flexDirection = .column
        layout.width = YGValue(UIScreen.main.bounds.width)
        layout.marginTop = YGValue(8)
        layout.paddingLeft = 16
        layout.paddingRight = 16
      }
    
      container.backgroundColor = .orange
//    print(container.frame.height)

      infoItemView.configureLayout { layout in
        layout.isEnabled = true
      }

      addressItemViewYOGA.configureLayout { layout in
        layout.isEnabled = true
      }

      previewItemViewYOGA.configureLayout { (layout) in
        layout.isEnabled = true
      }
    
      contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

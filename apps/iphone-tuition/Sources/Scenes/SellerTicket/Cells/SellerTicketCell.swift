//
//  SellerTicketCell.swift
//  AppLibrary
//
//  Created by wtildestar on 08/05/2020.
//

import EsoftUIKit
import YogaKit

public final class SellerTicketCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "SellerTicketCellID"
  
  private(set) lazy var container: UIView = UIView()
  private(set) lazy var costItemViewYoga: CostItemViewYoga = CostItemViewYoga()
  private(set) lazy var photoItemViewYoga: PhotoItemViewYoga = PhotoItemViewYoga()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    
    costItemViewYoga.price = ""
  }
  
  private func createUI() {
    container.addSubview(costItemViewYoga)
    container.addSubview(photoItemViewYoga)
    contentView.addSubview(container)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.backgroundColor = AppTheme.current().colors.screen
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    container.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
      layout.width = YGValue(UIScreen.main.bounds.width)
    }
    
    costItemViewYoga.configureLayout { layout in
      layout.isEnabled = true
    }
    
    photoItemViewYoga.configureLayout { layout in
      layout.isEnabled = true
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

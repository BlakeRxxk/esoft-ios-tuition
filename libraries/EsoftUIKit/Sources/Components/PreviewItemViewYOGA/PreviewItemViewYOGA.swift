//
//  PreviewItemViewYOGA.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 23.04.2020.
//

import UIKit
import BaseUI
import BaseFRP
import ThemeManager
import YogaKit

public final class PreviewItemViewYOGA: View {
  
  public var currentPrice: String {
    get {
      currentPriceLabel.styledText ?? ""
    }
    set {
      currentPriceLabel.styledText = newValue
      currentPriceLabel.yoga.markDirty()
    }
  }

  public var price: String {
    get {
      priceLabel.styledText ?? ""
    }
    set {
      priceLabel.styledText = newValue
      priceLabel.yoga.markDirty()
    }
  }

  public var address: String {
    get {
      addressLabel.styledText ?? ""
    }
    set {
      addressLabel.styledText = newValue
      addressLabel.yoga.markDirty()
    }
  }

  public var photo: UIImage? {
    get {
      image.image
    }
    set {
      image.image = newValue
    }
  }
  
  public var dataSet: [String] {
    get {
      dataSet
    }
    set {
      data = newValue
      collectionView.reloadData()
    }
  }
  
  // topView
  private(set) lazy var topView = UIView()
  private(set) lazy var topViewStack = UIView()
  private(set) lazy var currentPriceLabel = UILabel()
  private(set) lazy var priceStack = UIView()
  private(set) lazy var priceImage = UIImageView()
  
  private(set) lazy var priceLabel = UILabel()
  private(set) lazy var addressLabel = UILabel()
  
  // mainView
  private(set) lazy var mainView = UIView()
  private(set) lazy var image = UIImageView()
  
  private(set) lazy var data: [String] = []
  private(set) lazy var collectionView: UICollectionView = {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//    layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    let cv: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    cv.isScrollEnabled = false
    layout.scrollDirection = .horizontal
    cv.isPagingEnabled = true
    cv.register(PreviewImageCell.self, forCellWithReuseIdentifier: PreviewImageCell.reuseId)
    return cv
  }()
  
  private(set) lazy var favoriteButton = UIButton()
  
//  private var activeConstraints: [NSLayoutConstraint] = []
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  private func createUI() {
    
//    let subviews: [UIView] = [
//      topView,
//      topViewStack,
//      currentPriceLabel,
//      priceStack,
//      priceImage,
//      priceLabel,
//      addressLabel,
//      mainView,
//      image,
//      collectionView
//    ]
//
//    subviews.forEach {
//      $0.translatesAutoresizingMaskIntoConstraints = false
//    }
    
    topView.addSubview(topViewStack)
    topViewStack.addSubview(currentPriceLabel)
    topViewStack.addSubview(priceStack)
    priceStack.addSubview(priceImage)
    priceStack.addSubview(priceLabel)
    topView.addSubview(addressLabel)
    
//    mainView.addSubview(image)
    mainView.addSubview(collectionView)
    mainView.addSubview(favoriteButton)
    
    addSubview <^> [
      topView,
      mainView
    ]
  }
  
  private func configureUI() {
    
    collectionView.backgroundColor = .white
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.layer.cornerRadius = 8
    collectionView.clipsToBounds = true
    
    priceImage.image = UIImage.arrowDown
    priceImage.tintColor = ThemeManager.current().colors.primary500
    
    image.layer.cornerRadius = 8
    image.clipsToBounds = true
    image.backgroundColor = .gray
    
    favoriteButton.setBackgroundImage(UIImage.favorit, for: .normal)
    favoriteButton.tintColor = ThemeManager.current().colors.container
    
    addressLabel.numberOfLines = 0
    
    currentPriceLabel.setStyles(
      UILabel.Styles.title3
    )
    
    currentPriceLabel.setStyles(
      UILabel.Styles.title3
    )
    
    priceLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.strikeThrough,
      UILabel.ColorStyle.placeholders
    )
    
    addressLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.Styles.secondary
    )
  }
  
  private func layout() {
    
    configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
    }
    
    topView.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
      layout.paddingTop = 12
      layout.paddingBottom = 8
    }
    
    topViewStack.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.justifyContent = .spaceBetween
      layout.marginBottom = 2
    }
    
    currentPriceLabel.configureLayout { layout in
      layout.isEnabled = true
    }
    
    priceStack.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.alignItems = .center
    }
    
    priceImage.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 10
      layout.height = 10.5
      layout.marginRight = 3
    }
    
    priceLabel.configureLayout { layout in
      layout.isEnabled = true
    }
    
    addressLabel.configureLayout { layout in
      layout.isEnabled = true
    }
    
    mainView.configureLayout { layout in
      layout.isEnabled = true
      layout.position = .relative
    }
    
    image.configureLayout { layout in
      layout.isEnabled = true
      layout.height = 207
    }
    
    collectionView.configureLayout { layout in
      layout.isEnabled = true
      layout.height = 207
      layout.width = 100%
    }
    
    favoriteButton.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 23
      layout.height = 21.95
      layout.position = .absolute
      layout.top = 13
      layout.right = 12.5
    }
    
  }
  
}

extension PreviewItemViewYOGA: PreviewItemViewInputYOGA {}

extension PreviewItemViewYOGA: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    data.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewImageCell.reuseId, for: indexPath) as! PreviewImageCell
      cell.set(photoName: data[indexPath.row])
      return cell
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width
//    print(width)
    return CGSize(width: width, height: 207)
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    CGFloat(0)
  }
  
}

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
  
  public weak var output: PreviewItemViewOutputYOGA?
  
  private var phoneToCall = ""
  private var currentCode = ""
  
  let defaults = UserDefaults.standard
  
  public var phone: String {
    get {
      phoneToCall
    }
    set {
      if newValue.isEmpty {
        phoneButton.tintColor = .gray
        phoneButton.alpha = 0.5
      } else {
        phoneButton.tintColor = ThemeManager.current().colors.primary500
        phoneButton.alpha = 1
      }
      phoneToCall = newValue
    }
  }
  
  public var currentPrice: String {
    get {
      currentPriceLabel.styledText ?? ""
    }
    set {
      guard let number = zeroPadding(newValue) else { return }
      currentPriceLabel.styledText = "\(number) руб."
      currentPriceLabel.yoga.markDirty()
    }
  }
  
  public var oldPrice: String {
    get {
      priceLabel.styledText ?? ""
    }
    set {
      if newValue.isEmpty {
        priceStack.isHidden = true
      } else {
        guard  let number = zeroPadding(newValue) else { return }
        priceStack.isHidden = false
        priceLabel.styledText = "\(number) руб."
      }
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
  
  private var totalPhotosCount = 0
  private var currentSlide = 1
  public var photos: [String] {
    get {
      photos
    }
    set {
      if !newValue.isEmpty {
        totalPhotosCount = newValue.count
        counterSlidesLabel.text = "\(currentSlide) / \(newValue.count)"
        counterSlidesWrapper.isHidden = false
        counterSlidesLabel.yoga.markDirty()
      } else {
        counterSlidesWrapper.isHidden = true
      }
      photosItems = newValue
      collectionView.reloadData()
    }
  }
  
  public var objectsDescription: String {
    get {
      mainTitle.styledText ?? ""
    }
    set {
      mainTitle.styledText = newValue
    }
  }
  
  public var views: String {
    get {
      viewsCount.styledText ?? ""
    }
    set {
      if newValue.isEmpty {
        viewsView.isHidden = true
      } else {
        viewsView.isHidden = false
        viewsCount.styledText = newValue
      }
      viewsCount.yoga.markDirty()
    }
  }
  
  public var favoritesCount: String {
    get {
      favoriteCount.styledText ?? ""
    }
    set {
      if newValue == "0" {
        favoriteView.isHidden = true
      } else {
        guard let rounded = roundToPlaces(newValue) else { return }
        favoriteView.isHidden = false
        favoriteCount.styledText = rounded
      }
      favoriteCount.yoga.markDirty()
    }
  }
  
  public var code: String {
    get {
      codeObject.styledText ?? ""
    }
    set {
      currentCode = newValue
      codeObject.styledText = "Код объекта: \(newValue)"
      codeObject.yoga.markDirty()
      
      // favorit
      var savedArray = defaults.object(forKey: "favorit") as? [String] ?? [String]()
      if savedArray.contains(newValue) {
        favoriteButton.setBackgroundImage(UIImage.favoritFill, for: .normal)
      } else {
        favoriteButton.setBackgroundImage(UIImage.favorit, for: .normal)
      }
    }
  }
  
  // установка в начальную позицию
  public var collectionViewDefaultPosition: Bool {
    get {
      false
    }
    set {
      if newValue {
        collectionView.contentOffset = .zero
        currentSlide = 1
      }
    }
  }
  
  public var isViewed: Bool {
    get {
      false
    }
    set {
      if newValue {
        isViewedWrap.isHidden = false
        topView.alpha = 0.6
        collectionView.alpha = 0.6
        mainTitle.alpha = 0.6
        infoStack.alpha = 0.6
      } else {
        isViewedWrap.isHidden = true
        topView.alpha = 1
        collectionView.alpha = 1
        mainTitle.alpha = 1
        infoStack.alpha = 1
      }
    }
  }
  
  private(set) lazy var container: UIView = UIView()
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
  private(set) lazy var photosItems: [String] = []
  public lazy var collectionView: UICollectionView = {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let cv: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    cv.isPagingEnabled = true
    cv.register(PreviewImageCell.self, forCellWithReuseIdentifier: PreviewImageCell.reuseId)
    return cv
  }()
  private(set) lazy var isViewedWrap: UIView = UIView()
  private(set) lazy var isViewedTag: UILabel = UILabel()
  private(set) lazy var favoriteButton: UIButton = UIButton()
  private(set) lazy var counterSlidesWrapper: UIView = UIView()
  private(set) lazy var counterSlidesLabel: UILabel = UILabel()
  private(set) lazy var titleStack: UIView = UIView()
  private(set) lazy var mainTitle: UILabel = UILabel()
  private(set) lazy var phoneButton: UIButton = UIButton()
  
  // info stack
  private(set) lazy var infoStack: UIView = UIView()
  private(set) lazy var viewsView: UIView = UIView()
  private(set) lazy var countsWrapped: UIView = UIView()
  private(set) lazy var viewsImage: UIImageView = UIImageView()
  private(set) lazy var viewsCount: UILabel = UILabel()
  private(set) lazy var favoriteView: UIView = UIView()
  private(set) lazy var favoriteImage: UIImageView = UIImageView()
  private(set) lazy var favoriteCount: UILabel = UILabel()
  private(set) lazy var codeObject: UILabel = UILabel()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
    layout()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    var savedArray = defaults.object(forKey: "favorit") as? [String] ?? [String]()
    if savedArray.contains(currentCode) {
      favoriteButton.setBackgroundImage(UIImage.favoritFill, for: .normal)
    } else {
      favoriteButton.setBackgroundImage(UIImage.favorit, for: .normal)
    }
  }
  
  func zeroPadding(_ toString: String) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = " "
    guard let number = formatter.number(from: toString) else {
      return nil
    }
    return formatter.string(from: number)
  }
  
  func roundToPlaces(_ places: String) -> String? {
    guard let num = Float(places) else {
      return nil
    }
    let aStr = String(format: "%.1f", num)
    return aStr
  }
  
  private func createUI() {
    
    topView.addSubview(topViewStack)
    topViewStack.addSubview(currentPriceLabel)
    topViewStack.addSubview(priceStack)
    priceStack.addSubview(priceImage)
    priceStack.addSubview(priceLabel)
    topView.addSubview(addressLabel)
    
    mainView.addSubview(collectionView)
    mainView.addSubview(favoriteButton)
    
    mainView.addSubview(isViewedWrap)
    isViewedWrap.addSubview(isViewedTag)
    
    mainView.addSubview(counterSlidesWrapper)
    counterSlidesWrapper.addSubview(counterSlidesLabel)
    
    titleStack.addSubview(mainTitle)
    titleStack.addSubview(phoneButton)
    
    infoStack.addSubview(viewsView)
    infoStack.addSubview(countsWrapped)
    
    countsWrapped.addSubview(viewsView)
    countsWrapped.addSubview(favoriteView)
    
    infoStack.addSubview(codeObject)
    
    viewsView.addSubview(viewsImage)
    viewsView.addSubview(viewsCount)
    
    favoriteView.addSubview(favoriteImage)
    favoriteView.addSubview(favoriteCount)
    
    container.addSubview <^> [
      topView,
      mainView,
      titleStack,
      infoStack
    ]
    
    addSubview(container)
  }
  
  private func configureUI() {
    
    viewsImage.image = UIImage.eye
    viewsImage.tintColor = ThemeManager.current().textColors.secondary
    favoriteImage.image = UIImage.starSmall
    favoriteImage.tintColor = ThemeManager.current().textColors.secondary
    
    counterSlidesWrapper.backgroundColor = .black
    counterSlidesWrapper.alpha = 0.4
    counterSlidesWrapper.layer.cornerRadius = 8
    counterSlidesWrapper.layer.masksToBounds = true
    
    counterSlidesLabel.font = UIFont.micro
    counterSlidesLabel.textColor = .white
    
    viewsCount.setStyles(
      UILabel.Styles.micro,
      UILabel.ColorStyle.placeholders
    )
    
    favoriteCount.setStyles(
      UILabel.Styles.micro,
      UILabel.ColorStyle.placeholders
    )
    
    codeObject.setStyles(
      UILabel.Styles.micro,
      UILabel.ColorStyle.placeholders
    )
    
    mainTitle.numberOfLines = 0
    
    mainTitle.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.primary
    )
    
    phoneButton.setBackgroundImage(UIImage.Call.right, for: .normal)
    phoneButton.tintColor = ThemeManager.current().colors.primary500
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.layer.cornerRadius = 8
    collectionView.clipsToBounds = true
    collectionView.backgroundColor = ThemeManager.current().colors.screen
    
    let img = UIImage.Logo.base
    collectionView.backgroundView = UIImageView.init(image: img)
    collectionView.backgroundView?.contentMode = .center
    collectionView.tintColor = ThemeManager.current().colors.container
    
    priceImage.image = UIImage.arrowDown
    priceImage.tintColor = ThemeManager.current().colors.primary500
    
    image.layer.cornerRadius = 8
    image.clipsToBounds = true
    
    isViewedWrap.backgroundColor = .black
    isViewedWrap.alpha = 0.4
    isViewedWrap.layer.cornerRadius = 4
    isViewedWrap.layer.masksToBounds = true
    isViewedTag.text = "Просмотрено"
    isViewedTag.font = UIFont.micro
    isViewedTag.textColor = .white
    
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
    
    let phoneAction = UITapGestureRecognizer(target: self, action: #selector(phoneButtonTap))
    phoneButton.addGestureRecognizer(phoneAction)
    
    let favoritAction = UITapGestureRecognizer(target: self, action: #selector(favoritButtonTap))
    favoriteButton.addGestureRecognizer(favoritAction)
    
  }
  
  @objc func phoneButtonTap() {
    didTapPhone()
  }
  
  @objc func favoritButtonTap() {
    didTapFavorit()
  }
  
  public func didTapPhone() {
    if !phoneToCall.isEmpty {
      guard let url = URL(string: "tel://\(phoneToCall)") else { return }
      guard UIApplication.shared.canOpenURL(url) else { return }
      
      UIApplication.shared.open(url)
    }
  }
  
  public func didTapFavorit() {
    var savedArray = defaults.object(forKey: "favorit") as? [String] ?? [String]()
    
    if savedArray.contains(currentCode) {
      favoriteButton.setBackgroundImage(UIImage.favorit, for: .normal)
      savedArray = savedArray.filter { $0 != currentCode }
    } else {
      favoriteButton.setBackgroundImage(UIImage.favoritFill, for: .normal)
      savedArray.append(currentCode)
    }
    defaults.set(savedArray, forKey: "favorit")
  }
  
  private func layout() {
    
    configureLayout { layout in
      layout.isEnabled = true
    }
    
    container.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
      layout.paddingLeft = 16
      layout.paddingRight = 16
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
    
    isViewedWrap.configureLayout { layout in
      layout.isEnabled = true
      layout.position = .absolute
      layout.top = 8
      layout.left = 8
      layout.paddingTop = 4
      layout.paddingLeft = 8
      layout.paddingRight = 8
      layout.paddingBottom = 4
    }
    
    isViewedTag.configureLayout { layout in
      layout.isEnabled = true
    }
    
    favoriteButton.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 23
      layout.height = 21.95
      layout.position = .absolute
      layout.top = 13
      layout.right = 12.5
    }
    
    counterSlidesWrapper.configureLayout { layout in
      layout.isEnabled = true
      layout.paddingLeft = 8
      layout.paddingRight = 8
      layout.height = 16
      layout.position = .absolute
      layout.alignSelf = .center
      layout.justifyContent = .center
      layout.alignItems = .center
      layout.bottom = 8
    }
    
    counterSlidesLabel.configureLayout { layout in
      layout.isEnabled = true
    }
    
    titleStack.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.alignItems = .center
      layout.justifyContent = .spaceBetween
      layout.paddingBottom = 4
      layout.paddingTop = 8
      layout.height = 48
      layout.width = 100%
    }
    
    mainTitle.configureLayout { layout in
      layout.isEnabled = true
      layout.flexShrink = 1
      layout.width = 80%
    }
    
    phoneButton.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 24
      layout.height = 24
    }
    
    infoStack.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.height = 24
      layout.paddingBottom = 8
      layout.alignItems = .center
      layout.justifyContent = .spaceBetween
    }
    
    countsWrapped.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
    }
    
    viewsView.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .row
      layout.alignItems = .center
    }
    
    viewsImage.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 11
      layout.height = 7.5
    }
    
    viewsCount.configureLayout { layout in
      layout.isEnabled = true
      layout.marginLeft = 5
    }
    
    favoriteView.configureLayout { layout in
      layout.isEnabled = true
      layout.marginLeft = 22
      layout.flexDirection = .row
      layout.alignItems = .center
    }
    
    favoriteImage.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 10
      layout.height = 9.41
    }
    
    favoriteCount.configureLayout { layout in
      layout.isEnabled = true
      layout.marginLeft = 5
    }
    
    codeObject.configureLayout { (layout) in
      layout.isEnabled = true
    }
    
  }
  
}

extension PreviewItemViewYOGA: PreviewItemViewInputYOGA {}
extension PreviewItemViewYOGA: PreviewItemViewOutputYOGA {}

extension PreviewItemViewYOGA: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    photosItems.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewImageCell.reuseId, for: indexPath) as! PreviewImageCell
    cell.set(photoName: photosItems[indexPath.row])
    return cell
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width
    
    return CGSize(width: width, height: 207)
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    CGFloat(0)
  }
  
  public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    
    for cell in collectionView.visibleCells {
      let indexPath = collectionView.indexPath(for: cell)
      currentSlide = indexPath!.row + 1
      counterSlidesLabel.text = "\(currentSlide) / \(totalPhotosCount)"
      counterSlidesLabel.yoga.markDirty()
      yoga.applyLayout(preservingOrigin: true)
    }
  }
  
}

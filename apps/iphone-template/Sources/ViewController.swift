//
//  ViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - UI
  
  private(set) lazy var container: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // topView
  
  private(set) lazy var topView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var topViewStack: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  
  private(set) lazy var currentPrice: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.text = "2 200 000 руб."
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private(set) lazy var priceStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()
  
  private(set) lazy var priceImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Arrow")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private(set) lazy var price: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6195520759, green: 0.619643569, blue: 0.6195320487, alpha: 1)
    label.font = label.font.withSize(13)
    
    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "2 300 000 руб.")
    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
    
    label.attributedText = attributeString
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private(set) lazy var address: UILabel = {
    let label = UILabel()
    label.text = "Тюмень, Центр: КПД, Республики"
    label.font = label.font.withSize(13)
    label.textColor = #colorLiteral(red: 0.458781004, green: 0.4588506818, blue: 0.4587657452, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // mainView
  
  private(set) lazy var mainView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var image: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "photo")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private(set) lazy var favoriteButton: UIButton = {
    let btn = UIButton()
    btn.setImage(UIImage(named: "Star"), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  // bottomView
  
  private(set) lazy var bottomView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var titleStack: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var mainTitle: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(13)
    label.textColor = #colorLiteral(red: 0.1293964982, green: 0.1294215322, blue: 0.1293910444, alpha: 1)
    label.numberOfLines = 0
    label.text = "Пансионат, 1-комн., 18 м², этаж 3/8, 69 444 руб./м²"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private(set) lazy var phoneButton: UIButton = {
    let btn = UIButton()
    btn.setImage(UIImage(named: "Phone"), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  private(set) lazy var infoStack: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()
  
  private(set) lazy var viewsView: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var viewsImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Shape")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private(set) lazy var viewsCount: UILabel = {
    let label = UILabel()
    label.text = "314"
    label.font = label.font.withSize(10)
    label.textColor = #colorLiteral(red: 0.6195520759, green: 0.619643569, blue: 0.6195320487, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private(set) lazy var favoriteView: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private(set) lazy var favoriteImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Star-small")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private(set) lazy var favoriteCount: UILabel = {
    let label = UILabel()
    label.text = "7,4"
    label.font = label.font.withSize(10)
    label.textColor = #colorLiteral(red: 0.6195520759, green: 0.619643569, blue: 0.6195320487, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private(set) lazy var codeObject: UILabel = {
    let label = UILabel()
    label.text = "Код объекта: 773355"
    label.font = label.font.withSize(10)
    label.textColor = #colorLiteral(red: 0.6195520759, green: 0.619643569, blue: 0.6195320487, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  // MARK: - Life
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupScreen()
    addSubviewInView()
    configureUI()
   
  }
  
  // MARK: - Functions
  
  private func setupScreen() {
    
    // view
    view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
    
    // navigation
    navigationItem.title = "Title"
    let nav = self.navigationController?.navigationBar
    nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    nav?.barTintColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
    
    // imageView
    image.layer.cornerRadius = 8
    image.clipsToBounds = true
    
  }
  
  private func addSubviewInView() {
    view.addSubview(container)
    
    container.addSubview(topView)
    topView.addSubview(topViewStack)
    topViewStack.addArrangedSubview(currentPrice)
    topViewStack.addArrangedSubview(priceStack)
    priceStack.addArrangedSubview(priceImage)
    priceStack.addArrangedSubview(price)
    topView.addSubview(address)
    
    container.addSubview(mainView)
    mainView.addSubview(image)
    mainView.addSubview(favoriteButton)
    
    container.addSubview(bottomView)
    bottomView.addSubview(titleStack)
    titleStack.addArrangedSubview(mainTitle)
    titleStack.addArrangedSubview(phoneButton)
    
    bottomView.addSubview(infoStack)
    
    infoStack.addArrangedSubview(viewsView)
    viewsView.addArrangedSubview(viewsImage)
    viewsView.addArrangedSubview(viewsCount)
    
    infoStack.addArrangedSubview(favoriteView)
    favoriteView.addArrangedSubview(favoriteImage)
    favoriteView.addArrangedSubview(favoriteCount)
    
    infoStack.addArrangedSubview(codeObject)
  }
  
  private func configureUI() {
    
    // setup
    priceStack.alignment = .center
    priceStack.spacing = 3
    
    titleStack.spacing = 60
    titleStack.alignment = .center
    
    viewsView.alignment = .center
    viewsView.spacing = 5
    favoriteView.alignment = .center
    favoriteView.spacing = 5
    
    infoStack.alignment = .center
    infoStack.distribution = .equalCentering
    
    let margins = view.layoutMarginsGuide
    
    // topView
    
    container.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
    container.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    container.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    topView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
    
    topViewStack.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12).isActive = true
    topViewStack.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16).isActive = true
    topViewStack.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16).isActive = true
    
    priceImage.widthAnchor.constraint(equalToConstant: 10).isActive = true
    priceImage.heightAnchor.constraint(equalToConstant: 10.5).isActive = true
    
    address.topAnchor.constraint(equalTo: topViewStack.bottomAnchor, constant: 2).isActive = true
    address.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16).isActive = true
    address.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16).isActive = true
    address.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8).isActive = true
    
    // mainView
    
    mainView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    image.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
    image.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16).isActive = true
    image.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16).isActive = true
    image.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    image.heightAnchor.constraint(equalToConstant: 207).isActive = true
    
    favoriteButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 13).isActive = true
    favoriteButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -28.5).isActive = true
    favoriteButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
    favoriteButton.widthAnchor.constraint(equalToConstant: 21.95).isActive = true
    
    // bottomView
    
    bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    bottomView.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    bottomView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
    
    titleStack.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 8).isActive = true
    titleStack.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16).isActive = true
    titleStack.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16).isActive = true
    
    phoneButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
    phoneButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
    
    infoStack.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 4).isActive = true
    infoStack.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16).isActive = true
    infoStack.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16).isActive = true
    infoStack.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -8).isActive = true
    
    favoriteView.leadingAnchor.constraint(equalTo: viewsView.trailingAnchor, constant: 22).isActive = true
    
    viewsImage.widthAnchor.constraint(equalToConstant: 11).isActive = true
    viewsImage.heightAnchor.constraint(equalToConstant: 7.5).isActive = true
    
    favoriteImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
    favoriteImage.heightAnchor.constraint(equalToConstant: 9.41).isActive = true
  }
  
}

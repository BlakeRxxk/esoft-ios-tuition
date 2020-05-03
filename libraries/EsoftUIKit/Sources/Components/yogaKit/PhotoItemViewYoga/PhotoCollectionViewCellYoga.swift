//
//  PhotoCollectionViewCellYoga.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by wtildestar on 26/04/2020.
//

import UIKit

final class PhotoCollectionViewCellYoga: UICollectionViewCell {
  
  static let reuseId = "PhotoCollectionViewCell"
  
  fileprivate let bg: UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.layer.cornerRadius = 8
    return iv
  }()

  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(index: String) {
    bg.image = UIImage(named: index)
  }
  
  private func setupUI() {
    contentView.addSubview(bg)
    
    NSLayoutConstraint.activate([
      bg.topAnchor.constraint(equalTo: contentView.topAnchor),
      bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
}

//
//  ViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlets
    private(set) lazy var costContainer: UIView = UIView()
    
    private(set) lazy var costSubheader: UILabel = UILabel()
    
    private(set) lazy var costStackView: UIStackView = UIStackView()
    
    private(set) lazy var costLabel: UILabel = UILabel()
    private(set) lazy var noticeLabel: UILabel = UILabel()
    
    private(set) lazy var divider: UIView = UIView()
    
    private(set) lazy var editButton: UIButton = UIButton()
    
    private(set) lazy var photoSubheader: UILabel = UILabel()
    
    private(set) lazy var photoContainer: UIView = UIView()
    
    private(set) lazy var showAllLabel: UILabel = UILabel()
    private(set) lazy var showAllStackView: UIStackView = UIStackView()
    private(set) lazy var showAllQuantityStackView: UIStackView = UIStackView()
    private(set) lazy var showAllQuantityLabel: UILabel = UILabel()
    private(set) lazy var arrowImage: UIImageView = UIImageView()
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        let cv: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = false
        cv.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseId)
        return cv
    }()
    
    fileprivate let data = [
        PhotoData(title: "1", backgroundImage: #imageLiteral(resourceName: "0")),
        PhotoData(title: "2", backgroundImage: #imageLiteral(resourceName: "photo2")),
        PhotoData(title: "3", backgroundImage: #imageLiteral(resourceName: "3")),
        PhotoData(title: "4", backgroundImage: #imageLiteral(resourceName: "photo2")),
        PhotoData(title: "5", backgroundImage: #imageLiteral(resourceName: "photo2")),
        PhotoData(title: "6", backgroundImage: #imageLiteral(resourceName: "photo2")),
        PhotoData(title: "7", backgroundImage: #imageLiteral(resourceName: "7")),
        PhotoData(title: "8", backgroundImage: #imageLiteral(resourceName: "7"))
    ]

    // MARK: - View Controller
    override func loadView() {
        view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        createUI()
        configureUI()
        layout()
    }
    
    // MARK: - Methods
    private func createUI() {
        view.addSubview(costSubheader)
        view.addSubview(costContainer)
        
        costContainer.addSubview(costStackView)
        
        costStackView.addArrangedSubview(costLabel)
        costStackView.addArrangedSubview(noticeLabel)
        
        costContainer.addSubview(divider)
        costContainer.addSubview(editButton)
        
        view.addSubview(photoSubheader)
        view.addSubview(photoContainer)
        photoContainer.addSubview(collectionView)
        photoContainer.addSubview(showAllStackView)
        showAllStackView.addArrangedSubview(showAllLabel)
        showAllStackView.addArrangedSubview(showAllQuantityStackView)
        showAllQuantityStackView.addArrangedSubview(showAllQuantityLabel)
        showAllQuantityStackView.addArrangedSubview(arrowImage)
    }
    
    private func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        
        navigationItem.title = "Title"
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav?.barTintColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        
        costSubheader.text = "Стоимость объекта"
        costSubheader.textColor = #colorLiteral(red: 0.01568627451, green: 0.01568627451, blue: 0.05882352941, alpha: 0.4)
        
        costContainer.backgroundColor = .white
        
        costStackView.alignment = .center
        costStackView.axis = .horizontal
        costStackView.spacing = 16.0
        costStackView.isLayoutMarginsRelativeArrangement = true
        costStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        
        divider.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        
        costLabel.text = "700 500 000 руб."
        costLabel.font =  costLabel.font.withSize(17)
        
        noticeLabel.text = "Выше рыночной на 90%"
        noticeLabel.font = noticeLabel.font.withSize(10)
        noticeLabel.textColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
        
        editButton.setImage(UIImage(named: "edit"), for: .normal)
        editButton.setTitle("Изменить", for: .normal)
        editButton.setTitleColor(#colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1), for: .normal)
        editButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)
        editButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        photoSubheader.text = "Фотографии"
        
        photoContainer.backgroundColor = .white
        collectionView.backgroundColor = .clear
        
        arrowImage.image = UIImage(named: "go")
        
        showAllLabel.textColor = .black
        
        showAllLabel.text = "Показать все"
        showAllQuantityLabel.text = "123"
        
        showAllStackView.alignment = .center
        
        showAllQuantityStackView.alignment = .center
        showAllQuantityStackView.spacing = 16
    }
    
    private func layout() {
        [
            costSubheader,
            costContainer,
            costStackView,
            costLabel,
            noticeLabel,
            divider,
            editButton,
            photoSubheader,
            photoContainer,
            collectionView,
            showAllStackView,
            showAllLabel,
            showAllQuantityStackView,
            showAllQuantityLabel,
            arrowImage
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        let margins = view.layoutMarginsGuide
        
        // MARK: - Constraints
        let constraints = [
            costSubheader.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            costSubheader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            costSubheader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            costContainer.topAnchor.constraint(equalTo: costSubheader.bottomAnchor, constant: 8),
            costContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            costContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            costContainer.heightAnchor.constraint(equalToConstant: 96),
            
            costStackView.topAnchor.constraint(equalTo: costContainer.topAnchor),
            costStackView.leadingAnchor.constraint(equalTo: costContainer.leadingAnchor, constant: 16),
            costStackView.trailingAnchor.constraint(equalTo: costContainer.trailingAnchor),
            costStackView.bottomAnchor.constraint(equalTo: divider.topAnchor),
            costStackView.heightAnchor.constraint(equalToConstant: 48),
            
            costLabel.leadingAnchor.constraint(equalTo: costStackView.leadingAnchor),
            costLabel.centerYAnchor.constraint(equalTo: costStackView.centerYAnchor),
            costLabel.widthAnchor.constraint(equalToConstant: 206),
            
            noticeLabel.leadingAnchor.constraint(equalTo: costLabel.trailingAnchor, constant: 16),
            noticeLabel.centerYAnchor.constraint(equalTo: costStackView.centerYAnchor),
            noticeLabel.widthAnchor.constraint(equalToConstant: 121),
            
            divider.leadingAnchor.constraint(equalTo: costStackView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: costStackView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            editButton.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 12),
            editButton.leadingAnchor.constraint(lessThanOrEqualTo: costContainer.leadingAnchor, constant: 19.43),
            editButton.trailingAnchor.constraint(equalTo: costContainer.trailingAnchor),
            editButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 343),
            
            photoSubheader.topAnchor.constraint(equalTo: costContainer.bottomAnchor, constant: 20),
            photoSubheader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            photoSubheader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            
            photoContainer.topAnchor.constraint(equalTo: photoSubheader.bottomAnchor, constant: 8),
            photoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: photoContainer.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: photoContainer.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: photoContainer.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 184),
            
            showAllStackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            showAllStackView.leadingAnchor.constraint(equalTo: photoContainer.leadingAnchor, constant: 16),
            showAllStackView.trailingAnchor.constraint(equalTo: photoContainer.trailingAnchor, constant: -16),
            showAllStackView.bottomAnchor.constraint(equalTo: photoContainer.bottomAnchor),
            showAllLabel.topAnchor.constraint(equalTo: showAllStackView.topAnchor, constant: 13),
            showAllLabel.bottomAnchor.constraint(equalTo: showAllStackView.bottomAnchor, constant: -13),
            showAllLabel.leadingAnchor.constraint(equalTo: showAllStackView.leadingAnchor),
            
            showAllQuantityLabel.centerYAnchor.constraint(equalTo: showAllLabel.centerYAnchor),
            
            arrowImage.heightAnchor.constraint(equalToConstant: 24),
            arrowImage.widthAnchor.constraint(equalToConstant: 24)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseId, for: indexPath) as! PhotoCollectionViewCell
        cell.data = self.data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }
}

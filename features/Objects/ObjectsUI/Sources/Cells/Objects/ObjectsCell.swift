//
//  SpecialistCell.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import Atlas
import BaseFRP
import EsoftUIKit

public final class ObjectsCell: UICollectionViewCell {
    
    private static let reuseIdentifier: String = "ObjectsCellID"
    
    public weak var output: ObjectsCellOutput?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ObjectsCell: ObjectsCellInput {}


//
//  Strng+Height.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 17.05.2020.
//

import UIKit

extension String {
    
    // расчитываем высоту в зависимости от размера шрифта
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(with: textSize,
                                     options: [.usesLineFragmentOrigin, .usesFontLeading],
                                     attributes: [NSAttributedString.Key.font: font],
                                     context: nil)
        return ceil(size.height)
    }
    
}

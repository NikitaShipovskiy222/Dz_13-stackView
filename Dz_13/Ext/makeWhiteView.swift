//
//  makeWhiteView.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 16/05/2024.
//

import UIKit

final class MakeWhiteView {
    
    static func makeWhiteView(x: CGFloat = 0, y: CGFloat = 0, w: CGFloat, h: CGFloat, addIcon: UIView, addText: UIView) -> UIView {
        {
            $0.backgroundColor = .white
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.addSubview(addIcon)
            $0.addSubview(addText)
            return $0
        }(UIView(frame: CGRect(x: x, y: y, width: w, height: h)))
        
    }
    
}

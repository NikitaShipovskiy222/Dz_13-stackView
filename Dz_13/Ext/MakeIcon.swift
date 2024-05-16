//
//  MakeIcon.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 16/05/2024.
//

import UIKit


final class MakeIcon {
    static func setupMakeIcon(img: UIImage) -> UIImageView {
        {
            $0.image = img
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            return $0
        }(UIImageView(frame: CGRect(x: 11, y: 12, width: 23, height: 23)))
    }
}

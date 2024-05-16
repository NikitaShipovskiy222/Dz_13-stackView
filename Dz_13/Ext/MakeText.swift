//
//  MakeText.swift
//  Dz_13
//
//  Created by Nikita Shipovskiy on 16/05/2024.
//

import UIKit


final class MakeText {
    static func makeText(text: String) -> UILabel {
        {
            $0.text = text
            $0.textColor = .mainBlack
            $0.font = UIFont(name: "Ubuntu-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
            $0.textAlignment = .left
            $0.numberOfLines = 0
            return $0
        }(UILabel(frame: CGRect(x: 72, y: 15, width: 200, height: 36)))
    }
}

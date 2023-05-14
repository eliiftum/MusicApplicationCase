//
//  UIImageview+Extension.swift
//  MusicApplicationCase
//
//  Created by Elif Tum on 10.05.2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func kfImage(url: String) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url)!)
    }
}

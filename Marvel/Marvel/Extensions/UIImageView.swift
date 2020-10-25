//
//  UIImageView.swift
//  Marvel
//
//  Created by Jorge Martínez on 25/10/2020.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL?) {
        guard let url = url else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//
//  Storyboarded.swift
//  Marvel
//
//  Created by Jorge Martínez on 23/10/2020.
//

import Foundation
import UIKit

protocol Storyboarded: class {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}

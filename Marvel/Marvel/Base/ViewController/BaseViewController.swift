//
//  BaseViewController.swift
//  Marvel
//
//  Created by Jorge Martínez on 23/10/2020.
//

import Foundation
import UIKit

protocol BaseViewControllerNavigationOptions: class {
    var navTitle: String? { get set }
    var navBarTitleLarge: Bool? { get set }
}

class BaseViewController: UIViewController, Storyboarded, BaseViewControllerNavigationOptions {
    
    override func viewDidLoad() { super.viewDidLoad() }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated) }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated) }
    
    var navTitle: String? {
        didSet {
            self.title = navTitle
        }
    }
    
    var navBarTitleLarge: Bool? {
        didSet {
            guard let navBarTitleLarge = navBarTitleLarge else { return }
            self.navigationController?.navigationBar.prefersLargeTitles = navBarTitleLarge
        }
    }
}

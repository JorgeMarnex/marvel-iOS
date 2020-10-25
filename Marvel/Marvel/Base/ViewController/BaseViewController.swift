//
//  BaseViewController.swift
//  Marvel
//
//  Created by Jorge Martínez on 23/10/2020.
//

import Foundation
import UIKit

protocol VisualResponseProtocol: class {
    func showLoader()
    func hideLoader()
    func showError(error: String)
}

protocol BaseViewControllerNavigationOptions: class {
    var navTitle: String? { get set }
    var navBarTitleLarge: Bool? { get set }
}

class BaseViewController: UIViewController, Storyboarded, BaseViewControllerNavigationOptions {
    
    override func viewDidLoad() { super.viewDidLoad() }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated) }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated) }
    
    private let spinner = SpinnerViewController()
    
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

extension BaseViewController: VisualResponseProtocol {
    
    func showLoader() {
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    
    func hideLoader() {
        spinner.willMove(toParent: nil)
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "Se ha producido un error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
}

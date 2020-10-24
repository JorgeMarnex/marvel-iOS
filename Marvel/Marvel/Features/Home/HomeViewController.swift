//
//  ViewController.swift
//  Marvel
//
//  Created by Jorge Martínez on 23/10/2020.
//

import UIKit

class HomeViewController: BaseViewController {

    weak var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    private func configureView() {
        navTitle = "Home"
        navBarTitleLarge = true
    }
    
    @IBAction func buyTapped(_ sender: Any) {
        viewModel?.pushToCreateAccount()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        viewModel?.pushToCreateAccount()
    }
}


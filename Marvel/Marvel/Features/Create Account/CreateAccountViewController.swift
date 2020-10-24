//
//  CreateAccountViewController.swift
//  Marvel
//
//  Created by Jorge Martínez on 23/10/2020.
//

import UIKit

class CreateAccountViewController: BaseViewController {

    weak var viewModel: CreateAccountViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Account"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.didFinish()
    }
}

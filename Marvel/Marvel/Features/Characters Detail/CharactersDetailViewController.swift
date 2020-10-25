//
//  CreateAccountViewController.swift
//  Marvel
//
//  Created by Jorge Martínez on 23/10/2020.
//

import UIKit

final class CharactersDetailViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    weak var viewModel: CharactersDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.didFinish()
    }
    
    private func configureView() {
        navTitle = viewModel?.characterName
        navBarTitleLarge = true
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.load(url: viewModel?.characterImageURL)
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.text = viewModel?.characterDescription
    }
}

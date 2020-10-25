//
//  ViewController.swift
//  Marvel
//
//  Created by Jorge Martínez on 23/10/2020.
//

import UIKit

class CharactersViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var viewModel: CharactersViewModel?
    
    private var cellIdentifier = "CharacterCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
        callWebServices()
    }
    
    private func binding() {
        viewModel?.updateCharacters = updateCharacters
    }
    
    private func configureView() {
        navTitle = "Personajes"
        navBarTitleLarge = true
        setupCollectionView()
    }
    
    private func callWebServices() {
        viewModel?.getCharacters()
    }
    
    private func updateCharacters() {
        collectionView.reloadData()
    }
}

// MARK: CollectionView
extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.charactersCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CharacterCollectionViewCell {
            cell.character = viewModel?.characters?.data?.results?[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        setupCollectionViewItemSize()
    }
    
    private func setupCollectionViewItemSize() {
        let numbserOfColumnsInRow: CGFloat = 2
        let itemSpacing: CGFloat = 1
        let width: CGFloat = (view.bounds.size.width / numbserOfColumnsInRow) - itemSpacing
        let height: CGFloat = 320
        
        let collectionViewFlowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
        collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = itemSpacing
        collectionViewFlowLayout.minimumInteritemSpacing = itemSpacing
        
        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
    }
}

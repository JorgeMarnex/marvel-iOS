//
//  CharacterCollectionViewCell.swift
//  Marvel
//
//  Created by Jorge Martínez on 25/10/2020.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    
    var character: Character? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    private func configureCell() {
        self.imageView.contentMode = .scaleAspectFill
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.titleLabel.textColor = .white
        self.titleView.backgroundColor = .red
    }
    
    private func updateCell() {
        self.imageView.load(url: characterImageURL)
        self.titleLabel.text = character?.name
    }
    
    var characterImageURL: URL? {
        let thumbnail: CharacterThumbnail? = character?.thumbnail
        let path: String = thumbnail?.path ?? ""
        let fileExtension: String = thumbnail?.fileExtension ?? ""
        return URL(string: path + "." + fileExtension)
    }
}

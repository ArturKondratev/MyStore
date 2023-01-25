//
//  ScreenshotsCell.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 16.01.2023.
//

import UIKit

class ScreenshotsCell: UICollectionViewCell {
    
    static let reuseId = "ScreenshotsCell"
    
    private let screenshot: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(screenshot)
        NSLayoutConstraint.activate([
            screenshot.topAnchor.constraint(equalTo: contentView.topAnchor),
            screenshot.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            screenshot.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            screenshot.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.screenshot.image = nil
    }
    func configure(image: UIImage) {
        self.screenshot.image = image
    }
    
}


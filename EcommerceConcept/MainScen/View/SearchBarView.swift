//
//  SearchBarView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 08.01.2023.
//

import UIKit

protocol SearchBarViewDelegete {
    func serchBattonAction()
}

class SearchBarView: UIView {
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    // MARK: - Subviews
    private(set) lazy var textField: UITextField = {
        let textF = UITextField()
        
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.layer.cornerRadius = 17
        textF.clipsToBounds = true
        textF.backgroundColor = .white
        textF.tintColor = .brandDarkBlue
        textF.placeholder = "  Search"
        textF.clearButtonMode = .never
        textF.bounds.inset(by: self.padding)
        
        return textF
    }()
    
    private(set) lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "qrcode"), for: .normal)
        button.backgroundColor = .brandOrange
        button.tintColor = .white
        button.layer.cornerRadius = 17
        button.addTarget(self, action: #selector(seatchButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var delegete: SearchBarViewDelegete?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    // MARK: - Functions
    @objc func seatchButtonPressed() {
        delegete?.serchBattonAction()
    }
    
    // MARK: - UI
    private func setUI() {
        self.addSubview(searchButton)
        self.addSubview(textField)
        
        NSLayoutConstraint.activate([
            self.searchButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.searchButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -34),
            self.searchButton.widthAnchor.constraint(equalToConstant: 34),
            self.searchButton.heightAnchor.constraint(equalToConstant: 34),
            
            self.textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            self.textField.rightAnchor.constraint(equalTo: self.searchButton.leftAnchor, constant: -11),
            self.textField.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
}

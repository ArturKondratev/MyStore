//
//  DetailsView.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 16.01.2023.
//

import UIKit
import HCSStarRatingView

class DescriptionsDetailsView: UIView {
    
    var sliderCenterButton1 = NSLayoutConstraint()
    var sliderCenterButton2 = NSLayoutConstraint()
    var sliderCenterButton3 = NSLayoutConstraint()
    
    // MARK: - Subviews
    private(set) var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshotsCell.self, forCellWithReuseIdentifier: ScreenshotsCell.reuseId)
        return collectionView
    }()
    
    private(set) lazy var deviceNameLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .brandDarkBlue
        label.text = "Iphone 14 ProMax"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()

    private(set) lazy var likeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.backgroundColor = .brandDarkBlue
        button.tintColor = .white
        button.layer.cornerRadius = 6
        return button
    }()

    private(set) lazy var ratingStarView: HCSStarRatingView = {
        let view = HCSStarRatingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.maximumValue = 5
        view.minimumValue = 0
        view.value = CGFloat(3.7)
        view.allowsHalfStars = true
        view.starBorderColor = .brandOrange
        view.tintColor = .brandOrange

        view.isUserInteractionEnabled = false
        view.backgroundColor = .mainBackgroundColor
        return view
    }()
    
    private(set) lazy var sliderVew: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brandOrange
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var shopButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Shop", for: .normal)
        button.tintColor = .brandDarkBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    private(set) lazy var detailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Details", for: .normal)
        button.tintColor = .brandDarkBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    private(set) lazy var featuresButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Features", for: .normal)
        button.tintColor = .brandDarkBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    lazy var cpuIcon = makeImage(imageName: "cpu")
    lazy var cameraIcon = makeImage(imageName: "camera")
    lazy var memoryIcon = makeImage(imageName: "memorychip")
    lazy var sdCardIcon = makeImage(imageName: "sdcard")
    
    lazy var cpuText = makeLable(text: "M1")
    lazy var cameraText = makeLable(text: "108 + 12 mp")
    lazy var memoryText = makeLable(text: "8 GB")
    lazy var sdCardtext = makeLable(text: "250 GB")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var selectColorLable: UILabel = {
        let lable = makeLable(text: "Select color and capacity")
        lable.textColor = .brandDarkBlue
        lable.font = UIFont.boldSystemFont(ofSize: 24)
        return lable
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["128GB", "256GB"])
        segment.selectedSegmentTintColor = .brandOrange
        segment.backgroundColor = .mainBackgroundColor
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private(set) lazy var colorButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.backgroundColor = .brown
        button.tintColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    private(set) lazy var colorButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brandDarkBlue
        button.tintColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    private(set) lazy var addToCardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brandOrange
        button.tintColor = .white
        button.layer.cornerRadius = 14
        button.setTitle("Add to Cart  $1,500.00", for: .normal)
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addHeader()
        addTabBarView()
        addDescriptionView()
        addSelectColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addHeader()
        addTabBarView()
        addDescriptionView()
        addSelectColor()
    }
    
    func addHeader() {
        addSubview(deviceNameLable)
        addSubview(likeButton)
        addSubview(ratingStarView)

        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: topAnchor),
            likeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            likeButton.widthAnchor.constraint(equalToConstant: 30),

            deviceNameLable.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            deviceNameLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),

            ratingStarView.topAnchor.constraint(equalTo: deviceNameLable.bottomAnchor, constant: 10),
            ratingStarView.leftAnchor.constraint(equalTo: deviceNameLable.leftAnchor, constant: 5),
            ratingStarView.heightAnchor.constraint(equalToConstant: 30),
            ratingStarView.widthAnchor.constraint(equalToConstant: 110),
        ])
    }
    
    func addTabBarView() {
        self.addSubview(shopButton)
        shopButton.topAnchor.constraint(equalTo: ratingStarView.bottomAnchor, constant: 10).isActive = true
        shopButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        shopButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        self.addSubview(detailsButton)
        detailsButton.topAnchor.constraint(equalTo: shopButton.topAnchor).isActive = true
        detailsButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailsButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        self.addSubview(featuresButton)
        featuresButton.topAnchor.constraint(equalTo: shopButton.topAnchor).isActive = true
        featuresButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        featuresButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        self.addSubview(sliderVew)
        sliderVew.heightAnchor.constraint(equalToConstant: 8).isActive = true
        sliderVew.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sliderVew.topAnchor.constraint(equalTo: shopButton.bottomAnchor).isActive = true
        
        sliderCenterButton1 = sliderVew.centerXAnchor.constraint(equalTo: shopButton.centerXAnchor)
        sliderCenterButton2 = sliderVew.centerXAnchor.constraint(equalTo: detailsButton.centerXAnchor)
        sliderCenterButton3 = sliderVew.centerXAnchor.constraint(equalTo: featuresButton.centerXAnchor)
        sliderCenterButton1.isActive = true
    }
    
    func addDescriptionView() {
        addSubview(stackView)
        stackView.addArrangedSubview(cpuIcon)
        stackView.addArrangedSubview(cameraIcon)
        stackView.addArrangedSubview(memoryIcon)
        stackView.addArrangedSubview(sdCardIcon)
        
        addSubview(cpuText)
        addSubview(cameraText)
        addSubview(memoryText)
        addSubview(sdCardtext)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: sliderVew.bottomAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            cpuText.centerXAnchor.constraint(equalTo: cpuIcon.centerXAnchor),
            cpuText.topAnchor.constraint(equalTo: cpuIcon.bottomAnchor, constant: 8),
            cameraText.centerXAnchor.constraint(equalTo: cameraIcon.centerXAnchor),
            cameraText.topAnchor.constraint(equalTo: cameraIcon.bottomAnchor, constant: 8),
            memoryText.centerXAnchor.constraint(equalTo: memoryIcon.centerXAnchor),
            memoryText.topAnchor.constraint(equalTo: memoryIcon.bottomAnchor, constant: 8),
            sdCardtext.centerXAnchor.constraint(equalTo: sdCardIcon.centerXAnchor),
            sdCardtext.topAnchor.constraint(equalTo: sdCardIcon.bottomAnchor, constant: 8)
        ])
        
        for view in stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 40),
                view.heightAnchor.constraint(equalToConstant: 40),
            ])
        }
    }
    
    func addSelectColor() {
        addSubview(selectColorLable)
        addSubview(colorButton1)
        addSubview(colorButton2)
        addSubview(segmentControl)
        addSubview(addToCardButton)
        
        NSLayoutConstraint.activate([
            selectColorLable.topAnchor.constraint(equalTo: cpuText.bottomAnchor, constant: 20),
            selectColorLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            colorButton1.topAnchor.constraint(equalTo: selectColorLable.bottomAnchor, constant: 20),
            colorButton1.leftAnchor.constraint(equalTo: selectColorLable.leftAnchor),
            colorButton1.widthAnchor.constraint(equalToConstant: 40),
            colorButton1.heightAnchor.constraint(equalToConstant: 40),
            
            colorButton2.topAnchor.constraint(equalTo: colorButton1.topAnchor),
            colorButton2.leftAnchor.constraint(equalTo: colorButton1.rightAnchor, constant: 20),
            colorButton2.widthAnchor.constraint(equalToConstant: 40),
            colorButton2.heightAnchor.constraint(equalToConstant: 40),
            
            segmentControl.centerYAnchor.constraint(equalTo: colorButton1.centerYAnchor),
            segmentControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            segmentControl.heightAnchor.constraint(equalToConstant: 30),
            segmentControl.widthAnchor.constraint(equalToConstant: 200),
            
            addToCardButton.topAnchor.constraint(equalTo: colorButton1.bottomAnchor, constant: 20),
            addToCardButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            addToCardButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            addToCardButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}

extension DescriptionsDetailsView {
    
    func makeImage(imageName: String) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: imageName)
        image.tintColor = .systemGray
        return image
    }
    
    func makeLable(text: String) -> UILabel {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = text
        lable.font = UIFont.boldSystemFont(ofSize: 14)
        lable.textColor = .systemGray
        return lable
    }
}

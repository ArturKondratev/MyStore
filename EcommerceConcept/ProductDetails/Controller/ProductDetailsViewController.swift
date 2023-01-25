////
////  ProductDetailsBuilder.swift
////  EcommerceConcept
////
////  Created by Артур Кондратьев on 12.01.2023.
////
//
//import UIKit
//
//class ProductDetailsViewController: UIViewController {
//
//    // MARK: - Subviews
//    lazy var bagButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
//        button.setImage(UIImage(systemName: "bag"), for: .normal)
//        button.backgroundColor = .brandOrange
//        button.tintColor = .white
//        button.layer.cornerRadius = 8
//        button.clipsToBounds = true
//        return button
//    }()
//
//    lazy var backwardButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
//        button.addTarget(self, action: #selector(bacwardButtonAction), for: .touchUpInside)
//        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
//        button.backgroundColor = .brandDarkBlue
//        button.tintColor = .white
//        button.layer.cornerRadius = 8
//        button.clipsToBounds = true
//        return button
//    }()
//
//    // MARK: - Private Properties
//    private var detailsView: DescriptionsDetailsView {
//        return self.view as! DescriptionsDetailsView
//    }
//
//    // MARK: - LifeCycle
//    override func loadView() {
//        super.loadView()
//        self.view = DescriptionsDetailsView()
//        view.backgroundColor = .mainBackgroundColor
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Product Details"
//        view.backgroundColor = .mainBackgroundColor
//        configureNavBar()
//      //  uiConfig()
//    }
//
//    // MARK: - NavBarConfig
//    func configureNavBar() {
//        navigationController?.navigationBar.tintColor = .brandDarkBlue
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bagButton)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backwardButton)
//    }
//
//    @objc func bacwardButtonAction() {
//        navigationController?.popViewController(animated: true)
//    }
//
////    func uiConfig() {
////        detailsView.shopButton.addTarget(self, action: #selector(shopButtonAction), for: .touchUpInside)
////        detailsView.detailsButton.addTarget(self, action: #selector(detailsButtonAction), for: .touchUpInside)
////        detailsView.featuresButton.addTarget(self, action: #selector(featuresButtonAction), for: .touchUpInside)
////    }
//
////    //MARK: - Functions
////    @objc func shopButtonAction() {
////        detailsView.layoutIfNeeded()
////        detailsView.sliderCenterButton1.isActive = true
////        detailsView.sliderCenterButton2.isActive = false
////        detailsView.sliderCenterButton3.isActive = false
////        UIView.animate(withDuration: 0.5) {
////            self.detailsView.layoutIfNeeded()
////        }
////    }
////
////    @objc func detailsButtonAction() {
////        self.detailsView.layoutIfNeeded()
////        detailsView.sliderCenterButton1.isActive = false
////        detailsView.sliderCenterButton2.isActive = true
////        detailsView.sliderCenterButton3.isActive = false
////        UIView.animate(withDuration: 0.5) {
////            self.detailsView.layoutIfNeeded()
////        }
////    }
////
////    @objc func featuresButtonAction() {
////        self.detailsView.layoutIfNeeded()
////        detailsView.sliderCenterButton1.isActive = false
////        detailsView.sliderCenterButton2.isActive = false
////        detailsView.sliderCenterButton3.isActive = true
////        UIView.animate(withDuration: 0.5) {
////            self.detailsView.layoutIfNeeded()
////        }
////    }
//
//}
//

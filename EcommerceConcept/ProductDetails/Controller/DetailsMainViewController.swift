//
//  DetailsMainViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class DetailsMainViewController: UIViewController, DetailsMainViewDelegete {
    
    // MARK: - Properties
    lazy var screenShotVC = ScreenShotsViewController(product: self.product)
    lazy var ratingVC = RatingViewController(product: self.product)
    lazy var tabBarVC = TabBarViewController()
    lazy var selectVC = SelectViewController(product: self.product)
    
    // MARK: - Private Properties
    private var detailView: DetailsMainView {
        return self.view as! DetailsMainView
    }
    
    private let product: ProductModel
    private let viewModel: ProductDetailViewModel
    
    // MARK: - Init
    init(product: ProductModel, viewModel: ProductDetailViewModel) {
        self.product = product
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = DetailsMainView()
        view.backgroundColor = .mainBackgroundColor
        detailView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Details"
        view.backgroundColor = .mainBackgroundColor
        configureNavBar()
        addSubViews()
    }
    
    // MARK: - DetailsMainViewDelegete
    func addToCart() {
        viewModel.addToCartToProduct(self.product)
    }
    
    // MARK: - NavBarConfig
    func configureNavBar() {
        navigationController?.navigationBar.tintColor = .brandDarkBlue
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: makeBagButton())
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeBackwardButton())
    }
    
    @objc func bacwardButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func bagButtonAction() {
        viewModel.tabCartButton()
    }
    
    // MARK: - UI
    func addSubViews() {
        addScreenShotVC()
        addRatingVC()
        addTabBarVC()
        addSelectVC()
    }
    
    func addScreenShotVC() {
        self.addChildVC(screenShotVC)
        screenShotVC.view.backgroundColor = .red
        NSLayoutConstraint.activate([
            screenShotVC.view.topAnchor.constraint(equalTo: detailView.scrollView.topAnchor, constant: 10),
            screenShotVC.view.leftAnchor.constraint(equalTo: detailView.scrollView.leftAnchor),
            screenShotVC.view.rightAnchor.constraint(equalTo: detailView.scrollView.rightAnchor),
            screenShotVC.view.heightAnchor.constraint(equalToConstant: 250),
            screenShotVC.view.widthAnchor.constraint(equalTo: detailView.scrollView.widthAnchor)
        ])
    }
    
    func addRatingVC() {
        self.addChildVC(ratingVC)
        NSLayoutConstraint.activate([
            ratingVC.view.topAnchor.constraint(equalTo: screenShotVC.view.bottomAnchor, constant: 20),//20
            ratingVC.view.leftAnchor.constraint(equalTo: detailView.scrollView.leftAnchor),
            ratingVC.view.rightAnchor.constraint(equalTo: detailView.scrollView.rightAnchor),
            ratingVC.view.widthAnchor.constraint(equalTo: detailView.scrollView.widthAnchor),
            ratingVC.view.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func addTabBarVC() {
        self.addChildVC(tabBarVC)
        NSLayoutConstraint.activate([
            tabBarVC.view.topAnchor.constraint(equalTo: ratingVC.view.bottomAnchor),
            tabBarVC.view.leftAnchor.constraint(equalTo: detailView.scrollView.leftAnchor),
            tabBarVC.view.rightAnchor.constraint(equalTo: detailView.scrollView.rightAnchor),
            tabBarVC.view.widthAnchor.constraint(equalTo: detailView.scrollView.widthAnchor),
            tabBarVC.view.heightAnchor.constraint(equalToConstant: 120)//120
        ])
    }

    func addSelectVC() {
        self.addChildVC(selectVC)
        NSLayoutConstraint.activate([
            selectVC.view.topAnchor.constraint(equalTo: tabBarVC.view.bottomAnchor, constant: 20),
            selectVC.view.leftAnchor.constraint(equalTo: detailView.scrollView.leftAnchor),
            selectVC.view.rightAnchor.constraint(equalTo: detailView.scrollView.rightAnchor),
            selectVC.view.bottomAnchor.constraint(equalTo: detailView.scrollView.bottomAnchor),
            selectVC.view.widthAnchor.constraint(equalTo: detailView.scrollView.widthAnchor),
            selectVC.view.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension DetailsMainViewController {
    func addChildVC(_ vc : UIViewController) {
        addChild(vc)
        self.detailView.scrollView.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeBagButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
        button.addTarget(self, action: #selector(bagButtonAction), for: .touchUpInside)
        button.setImage(UIImage(systemName: "bag"), for: .normal)
        button.backgroundColor = .brandOrange
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }
    
    func makeBackwardButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 37, height: 37))
        button.addTarget(self, action: #selector(bacwardButtonAction), for: .touchUpInside)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.backgroundColor = .brandDarkBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }
    
}

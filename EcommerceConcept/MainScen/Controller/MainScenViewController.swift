//
//  MainScenViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 13.01.2023.
//

import UIKit

class MainScenViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Properties
    lazy var selesctCategoryVC = SelectCategoryViewController(viewModel: viewModel)
    lazy var searchBarVC = SearchBarViewController()
    lazy var hotSealsVC = HotSalesViewController(viewModel: viewModel)
    lazy var bestSellerVC = BestSellerViewController(viewModel: viewModel)
    
    lazy var heightCV = CGFloat(((bestSellerVC.bestSelerProducts.count ) / 2) * 230 + 330)
    
    // MARK: - Private Properties
    private var mainScenView: MainScenView {
        return self.view as! MainScenView
    }
    private let viewModel: MainScenViewModel
    
    //MARK: - Init
    init(viewModel: MainScenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = MainScenView()
        view.backgroundColor = .mainBackgroundColor
        mainScenView.scrollView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defer {
            addSabViews()
        }
        viewModel.mainScenViewDidLoad()
        configureNavBar()
        configureTabBar()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.mainScenViewDidLoad()
        scrollToUp()
        
    }
    
    // MARK: - Private methods
    private func bindViewModel() {
        self.viewModel.countInCard.addObserver(self) { [weak self] (count, _) in
            if count != 0 {
                self?.mainScenView.bagButton.badge = "\(count)"
            } else {
                self?.mainScenView.bagButton.badge = nil
            }
        }
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let verticalDistance = scrollView.contentOffset.y
        if verticalDistance > 100 {
            self.mainScenView.arrowUppButton.isHidden = false
        } else {
            self.mainScenView.arrowUppButton.isHidden = true
        }
    }
    
    @objc func scrollToUp() {
        self.mainScenView.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    //MARK: - ConfigureNavBar
    private func configureNavBar() {
        self.title = "Ecommerce"
        navigationController?.navigationBar.tintColor = .brandDarkBlue
        let filterButton = UIBarButtonItem(image: UIImage(named: "filter (4)"),
                                           style: UIBarButtonItem.Style.plain,
                                           target: self,
                                           action: #selector(filterButtonAction))
//        let menuButton = UIBarButtonItem(image: UIImage(named: "menu-1"),
//                                         style: UIBarButtonItem.Style.done,
//                                         target: self,
//                                         action: #selector(toggleMenu))
        
        self.navigationItem.rightBarButtonItem = filterButton
     //   self.navigationItem.leftBarButtonItem = menuButton
    }
    
    //MARK: - NavigationBar Action
    @objc func filterButtonAction() {
//        let myCartVC = DetailsMainViewController()
//        navigationController?.pushViewController(myCartVC, animated: true)
    }
    
    //MARK: - ConfigureTabBar
    private func configureTabBar() {
        mainScenView.arrowUppButton.addTarget(self, action: #selector(scrollToUp), for: .touchUpInside)
        mainScenView.bagButton.addTarget(self, action: #selector(tbCartButtonAction), for: .touchUpInside)
        mainScenView.heartButton.addTarget(self, action: #selector(tbHeartButtonAction), for: .touchUpInside)
        mainScenView.personButton.addTarget(self, action: #selector(tbPersonButtonAction), for: .touchUpInside)
    }
        
    //MARK: - TabBar Actions
    @objc func tbCartButtonAction() {
        viewModel.tabCartButton()
    }
    
    @objc func tbHeartButtonAction() {
        let VC = UIViewController()
        VC.view.backgroundColor = .mainBackgroundColor
        VC.title = "Heart"
        navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func tbPersonButtonAction() {
        let VC = UIViewController()
        VC.view.backgroundColor = .mainBackgroundColor
        VC.title = "Person"
        navigationController?.pushViewController(VC, animated: true)
    }
    
    //MARK: - UI
    func addSabViews(){
        addSelectCategoryCollectionVC()
        addSearchBarVC()
        addHotSealsVC()
        addBestSellerVC()
    }
    
    func addSelectCategoryCollectionVC() {
        self.addChild(selesctCategoryVC)
        self.mainScenView.scrollView.addSubview(selesctCategoryVC.view)
        self.selesctCategoryVC.didMove(toParent: self)
        self.selesctCategoryVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selesctCategoryVC.view.topAnchor.constraint(equalTo: mainScenView.scrollView.topAnchor, constant: 10),
            selesctCategoryVC.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            selesctCategoryVC.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            selesctCategoryVC.view.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func addSearchBarVC() {
        self.addChild(self.searchBarVC)
        self.mainScenView.scrollView.addSubview(searchBarVC.view)
        self.searchBarVC.didMove(toParent: self)
        self.searchBarVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.searchBarVC.view.topAnchor.constraint(equalTo: self.selesctCategoryVC.view.bottomAnchor, constant: 16),
            self.searchBarVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.searchBarVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.searchBarVC.view.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func addHotSealsVC() {
        self.addChild(self.hotSealsVC)
        self.mainScenView.scrollView.addSubview(self.hotSealsVC.view)
        self.hotSealsVC.didMove(toParent: self)
        self.hotSealsVC.view.translatesAutoresizingMaskIntoConstraints =  false
        
        NSLayoutConstraint.activate([
            self.hotSealsVC.view.topAnchor.constraint(equalTo: self.searchBarVC.view.bottomAnchor, constant: 16),
            self.hotSealsVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.hotSealsVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.hotSealsVC.view.heightAnchor.constraint(equalToConstant: 230),
        ])
    }
    
    func addBestSellerVC() {
        
        self.addChild(self.bestSellerVC)
        self.mainScenView.scrollView.addSubview(self.bestSellerVC.view)
        self.bestSellerVC.didMove(toParent: self)
        self.bestSellerVC.view.translatesAutoresizingMaskIntoConstraints = false
        
       // lazy var heightCV = CGFloat(((bestSellerVC.bestSelerProducts.count ) / 2) * 230 + 330)
        lazy var heightCV = CGFloat((5 / 2) * 230 + 330)
        
        NSLayoutConstraint.activate([
            self.bestSellerVC.view.topAnchor.constraint(equalTo: hotSealsVC.view.bottomAnchor, constant: 10),
            self.bestSellerVC.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.bestSellerVC.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.bestSellerVC.view.bottomAnchor.constraint(equalTo: mainScenView.scrollView.bottomAnchor),
            self.bestSellerVC.view.heightAnchor.constraint(equalToConstant: heightCV),
        ])
    }
}

//private extension UIViewController {
//    func add(_ child: UIViewController) {
//        addChild(child)
//        view.addSubview(child.view)
//        child.didMove(toParent: self)
//        child.view.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    func remove() {
//        willMove(toParent: nil)
//        view.removeFromSuperview()
//        removeFromParent()
//    }
//}


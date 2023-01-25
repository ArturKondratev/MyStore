//
//  RatingViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 17.01.2023.
//

import UIKit

class RatingViewController: UIViewController {
    
    // MARK: - Private Properties
    private var ratingView: RatingView {
        return self.view as! RatingView
    }
    
    var product: ProductModel {
        didSet{
            configureView()
        }
    }
    
    // MARK: - Init
    init(product: ProductModel) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        self.view = RatingView()
        view.backgroundColor = .mainBackgroundColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    func configureView() {
        DispatchQueue.main.async {
            self.ratingView.deviceNameLable.text = self.product.title
            self.ratingView.ratingStarView.value = CGFloat(self.product.rating)
        }
        
        
    }


}

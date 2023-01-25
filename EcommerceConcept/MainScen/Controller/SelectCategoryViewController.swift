//
//  SelectCategoryViewController.swift
//  EcommerceConcept
//
//  Created by Артур Кондратьев on 11.01.2023.
//

import UIKit

class SelectCategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var prodocts = [DeviceTypeModel](){
        didSet {
            selectCategoryView.collectionView.reloadData()
        }
    }
    
    // MARK: - Private Properties
    var selectCategoryView: SelectCategoryView {
        return self.view as! SelectCategoryView
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
        self.view = SelectCategoryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectCategoryView.collectionView.dataSource = self
        selectCategoryView.collectionView.delegate = self
        bindViewModel()
    }
    
    // MARK: - Private methods
    private func bindViewModel() {
        self.viewModel.allCategory.addObserver(self) { [weak self] (allProduct, _) in
            self?.prodocts = allProduct
        }
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth - 16, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prodocts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCategoryCollectionViewCell.identifier, for: indexPath) as? SelectCategoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(model: prodocts[indexPath.row])
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SelectCategoryCollectionViewCell
        cell?.selectCell(state: true)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    
        viewModel.didSelectCategiry(type: prodocts[indexPath.row].type )
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SelectCategoryCollectionViewCell
        cell?.selectCell(state: false)
    }
}

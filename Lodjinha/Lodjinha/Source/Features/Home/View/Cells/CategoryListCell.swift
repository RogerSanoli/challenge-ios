//
//  CategoryListCell.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 08/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import UIKit

class CategoryListCell: UITableViewCell {
 
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var loading: UIActivityIndicatorView!
    
    private var categories: [CategoryViewModel]?
    
    public var onSelectCategory: ((_ categoryID: Int) -> Void)?
    
    public func setup(_ viewModel: CategoryListViewModel) {
        
        collectionView.isHidden = viewModel.isLoading
        loading.isHidden = !viewModel.isLoading
        
        guard !viewModel.isLoading else { return }
        
        self.categories = viewModel.categoryList
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let cellSize = CGSize(width: 90, height: 104)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

extension CategoryListCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.categories?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: CategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell,
        let viewModel = self.categories?[indexPath.row] {
            cell.setup(viewModel)
            return cell
        }
        
        assertionFailure("Invalid cell type.")
        return UICollectionViewCell(frame: .zero)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let categoryID = categories?[indexPath.row].categoryID {
            self.onSelectCategory?(categoryID)
        }
    }
}

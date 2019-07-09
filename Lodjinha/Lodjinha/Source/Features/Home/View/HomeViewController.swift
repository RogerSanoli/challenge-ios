//
//  HomeViewController.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 07/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit
import PaladinKit

class HomeViewController: DKViewController<HomeSceneFactory> {
    
    @IBOutlet weak fileprivate var tableView: UITableView!
    
    fileprivate var interactor: HomeInteractorProtocol? {  return self.getAbstractInteractor() as? HomeInteractorProtocol }
    fileprivate var bannerViewModel: BannerViewModel?
    fileprivate var categoryListViewModel: CategoryListViewModel?
    fileprivate var bestSellerViewModels: [BestSellerViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupTableView()
        refresh()
    }
    
    private func setupNavigationController() {
        let imageView = UIImageView(image:UIImage(named: "logoNavbar"))
        imageView.frame = CGRect(x: imageView.frame.origin.x, y: imageView.frame.origin.y, width: 112, height: 30)
        self.navigationItem.titleView = imageView
    }
    
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "BannerCell")
        self.tableView.register(UINib(nibName: "CategoryListCell", bundle: nil), forCellReuseIdentifier: "CategoryListCell")
        self.tableView.register(UINib(nibName: "BestSellerCell", bundle: nil), forCellReuseIdentifier: "BestSellerCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func refresh() {
        self.bannerViewModel = BannerViewModel(nil)
        self.categoryListViewModel = CategoryListViewModel(nil)
        self.bestSellerViewModels = []
        
        async {
            self.interactor?.loadBanners()
            self.interactor?.loadCategories()
            self.interactor?.loadBestSellers()
        }
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    
    func alertError(_ message: String) {
        self.alert(message)
    }
    
    func presentBanner(_ viewModel: BannerViewModel) {
        self.bannerViewModel = viewModel
        self.tableView.reloadData()
    }
    
    func presentCategoryList(_ viewModel: CategoryListViewModel) {
        self.categoryListViewModel = viewModel
        self.tableView.reloadData()
    }
    
    func presentBestSellers(_ viewModelList: [BestSellerViewModel]) {
        self.bestSellerViewModels = viewModelList
        self.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + (self.bestSellerViewModels?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0,
        let bannerCell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? BannerCell,
        let viewModel = self.bannerViewModel {
            bannerCell.setup(viewModel)
            return bannerCell
        }
        
        if indexPath.row == 1,
        let categoryListCell = tableView.dequeueReusableCell(withIdentifier: "CategoryListCell", for: indexPath) as? CategoryListCell,
        let viewModel = self.categoryListViewModel {
            categoryListCell.setup(viewModel)
            
            categoryListCell.onSelectCategory = { [weak self] (categoryID) in
                print("CATEGORY SELECTED: \(categoryID)")
            }
            
            return categoryListCell
        }
        
        if let bestSellerCell = tableView.dequeueReusableCell(withIdentifier: "BestSellerCell", for: indexPath) as? BestSellerCell,
        let viewModel = self.bestSellerViewModels?[indexPath.row - 2] {
            bestSellerCell.setup(viewModel)
            return bestSellerCell
        }
        
        assertionFailure("Invalid cell type.")
        return UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row > 1,
        let viewModel = self.bestSellerViewModels?[indexPath.row - 2]
        else { return }
        
        print("PRODUCT SELECTED: \(viewModel.productID)")
    }
}

//
//  CategoryListViewController.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class ProductListViewController: DKViewController<ProductListSceneFactory> {
    
    fileprivate var interactor: ProductListInteractorProtocol? { return self.getAbstractInteractor() as? ProductListInteractorProtocol }
    
    @IBOutlet weak fileprivate var tableView: UITableView!
    @IBOutlet weak fileprivate var loading: UIActivityIndicatorView!
    
    public var categoryID: Int?
    public var categoryName: String?
    fileprivate var productViewModels: [ProductViewModel] = []
    fileprivate var hasMore: Bool = true
    fileprivate var isLoading: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        setupTableView()
        refresh()
    }
    
    private func setupNavigationController() {
        
        self.navigationItem.title = self.categoryName ?? ""
        
        let backItem = UIBarButtonItem()
        backItem.title = "Voltar"
        navigationItem.backBarButtonItem = backItem
    }
    
    private func setupTableView() {
        self.tableView.isAccessibilityElement = true
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func refresh() {
        guard let categoryID = self.categoryID else { return }
        
        self.isLoading = true
        self.hasMore = true
        self.productViewModels = []
        self.tableView.reloadData()
        
        async {
            self.interactor?.loadNextPage(categoryID)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetail",
            let productID = sender as? Int,
            let productDetailScene = segue.destination as? ProductDetailViewController {
            productDetailScene.productID = productID
        }
    }
}

extension ProductListViewController: ProductListViewControllerProtocol {
    func alertError(_ message: String) {
        self.loading.isHidden = true
        self.alert(message)
    }
    
    func presentProductList(_ viewModelList: [ProductViewModel], hasMore: Bool) {
        self.loading.isHidden = true
        self.isLoading = false
        self.hasMore = hasMore
        self.productViewModels.append(contentsOf: viewModelList)
        self.tableView.reloadData()
        
        if viewModelList.isEmpty {
            self.alert("Nenhum produto encontrado nesta categoria!") {  [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            productCell.setup(self.productViewModels[indexPath.row])
            return productCell
        }
        
        assertionFailure("Invalid cell type.")
        return UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "productDetail", sender: self.productViewModels[indexPath.row].productID)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let categoryID = self.categoryID, !self.isLoading, self.hasMore else { return }
        
        let height = scrollView.frame.size.height * 1.5
        let contentoffsetY = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentoffsetY
        
        if distanceFromBottom < height {
            self.isLoading = true
            
            async {
                self.interactor?.loadNextPage(categoryID)
            }
        }
    }
}

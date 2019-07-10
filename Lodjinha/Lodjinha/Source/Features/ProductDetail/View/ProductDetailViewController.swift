//
//  ProductDetailViewController.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 09/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import DungeonKit

class ProductDetailViewController: DKViewController<ProductDetailSceneFactory> {
    
    fileprivate var interactor: ProductDetailInteractorProtocol? { return self.getAbstractInteractor() as? ProductDetailInteractorProtocol }
    
    @IBOutlet weak fileprivate var tableView: UITableView!
    @IBOutlet weak fileprivate var reserveButton: UIButton!
    @IBOutlet weak private var reserveButtonContainer: UIView!
    @IBOutlet weak private var loading: UIActivityIndicatorView!
    
    public var productID: Int?
    private var productViewModel: ProductDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reserveButtonContainer.isHidden = true
        
        self.setupNavigationController()
        self.setupTableView()
        self.refresh()
    }
    
    private func setupNavigationController() {
        self.navigationItem.title = "Carregando..."
    }
    
    private func setupTableView() {
        self.tableView.isAccessibilityElement = true
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: "ProductDetailCell", bundle: nil), forCellReuseIdentifier: "ProductDetailCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func refresh() {
        guard let productID = self.productID else { return }
        
        async {
            self.interactor?.loadProduct(productID: productID)
        }
    }
    
    @IBAction func reservePressed(_ sender: Any) {
        guard let productID = self.productID else { return }
        
        async {
            self.interactor?.reserveProduct(productID: productID)
        }
    }
}

extension ProductDetailViewController: ProductDetailViewControllerProtocol {
    func alertError(_ message: String) {
        self.reserveButton.isEnabled = true
        self.alert(message)
    }
    
    func presentProduct(_ viewModel: ProductDetailViewModel) {
        self.productViewModel = viewModel
        self.navigationItem.title = viewModel.categoryTitle
        self.loading.isHidden = true
        self.reserveButtonContainer.isHidden = false
        self.tableView.reloadData()
    }
    
    func lockReserveButton() {
        self.reserveButton.isEnabled = false
    }
    
    func alertProductReserved() {
        self.alert("Produto reservado com sucesso!") {  [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productViewModel == nil ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let productCell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailCell", for: indexPath) as? ProductDetailCell,
            let viewModel = self.productViewModel {
            productCell.setup(viewModel)
            return productCell
        }
        
        assertionFailure("Invalid cell type.")
        return UITableViewCell(frame: .zero)
    }
}

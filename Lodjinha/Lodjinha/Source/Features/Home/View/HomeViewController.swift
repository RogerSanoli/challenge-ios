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
        //tableView.estimatedRowHeight = CGFloat.leastNonzeroMagnitude
        
        self.tableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "BannerCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func refresh() {
        self.bannerViewModel = BannerViewModel(nil)
        
        async {
            self.interactor?.loadBanners()
            //self.interactor?.loadCategories()
            //self.interactor?.loadBestSellers()
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
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0,
        let bannerCell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? BannerCell,
        let viewModel = self.bannerViewModel {
            bannerCell.setup(viewModel)
            return bannerCell
        }
        
        assertionFailure("Invalid cell type.")
        return UITableViewCell(frame: .zero)
    }
}

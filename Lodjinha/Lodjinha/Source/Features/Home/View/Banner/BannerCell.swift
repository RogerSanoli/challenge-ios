//
//  BannerCell.swift
//  Lodjinha
//
//  Created by Roger Sanoli on 08/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import Foundation
import UIKit
import PaladinKit

class BannerCell: UITableViewCell {
    
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var pageController: UIPageControl!
    @IBOutlet weak private var loading: UIActivityIndicatorView!
    
    private var timer: Timer?
    private let timeInterval = 5.0
    
    public func setup(_ viewModel: BannerViewModel) {
        scrollView.isHidden = viewModel.isLoading
        pageController.isHidden = viewModel.isLoading
        loading.isHidden = !viewModel.isLoading
        
        guard !viewModel.isLoading else { return }
        
        self.setupScrollView(viewModel)
        self.setupPageController(viewModel)
        self.setupTimer()
    }
    
    private func setupScrollView(_ viewModel: BannerViewModel) {
        
        let width = self.scrollView.frame.size.width
        let height = self.scrollView.frame.size.height
        let count = CGFloat(viewModel.urlList.count)
        
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: width * count, height: height)
        
        for (index, url) in viewModel.urlList.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * width, y: 0, width: width, height: height))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            self.scrollView.addSubview(imageView)
            imageView.download(url)
        }
    }
    
    private func setupPageController(_ viewModel: BannerViewModel) {
        self.pageController.numberOfPages = viewModel.urlList.count
        self.pageController.isHidden = viewModel.urlList.count == 1
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(nextPage), userInfo: nil, repeats: true)
    }
    
    @objc func nextPage() {
        self.pageController.currentPage = (self.pageController.currentPage == self.pageController.numberOfPages - 1) ? 0 : self.pageController.currentPage + 1
        scrollToCurrentPage()
    }
    
    private func scrollToCurrentPage() {
        let width = self.scrollView.frame.size.width
        self.scrollView.setContentOffset(CGPoint(x: CGFloat(self.pageController.currentPage) * width, y: 0), animated: true)
    }
}

extension BannerCell: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.pageController.currentPage = scrollView.currentPage
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageController.currentPage = scrollView.currentPage
    }
}

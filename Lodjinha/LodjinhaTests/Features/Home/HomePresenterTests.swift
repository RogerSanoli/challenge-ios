//
//  HomePresenterTests.swift
//  LodjinhaTests
//
//  Created by Roger Sanoli on 10/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import XCTest
@testable import Lodjinha
@testable import DungeonKit

class HomePresenterTests: XCTestCase {

    private var presenter: HomePresenter!
    fileprivate var view: MockedView!
    
    override func setUp() {
        presenter = HomePresenter()
        view = MockedView()
        presenter.setView(view)
    }
    
    override func tearDown() {
        presenter = nil
        view = nil
    }

    func testBannerViewModel() {
        let bannerMock = BannerEntity(id: 15, linkUrl: "http://google.com", urlImagem: "http://google.com")
        let invalidBannerMock = BannerEntity(id: nil, linkUrl: nil, urlImagem: nil)
        let listMock = ListEntity(data: [bannerMock, invalidBannerMock], offset: 0, total: 0)
        self.presenter.processBanners(listMock)
    }

    func testCategoryViewModel() {
        let categoryMock = CategoryEntity(id: 56, descricao: "Livros", urlImagem: "http://google.com")
        let invalidCategoryMock = CategoryEntity(id: nil, descricao: nil, urlImagem: nil)
        let listMock = ListEntity(data: [categoryMock, invalidCategoryMock], offset: 0, total: 0)
        self.presenter.processCategories(listMock)
    }
    
    func testBestSellerViewModel() {
        let categoryMock = CategoryEntity(id: 1, descricao: "Games", urlImagem: "http://google.com")
        let productMock = ProductEntity(id: 1, nome: "Zelda: Breath of the Wild", descricao: "Melhor jogo ever", urlImagem: "http://google.com", precoDe: 1000000, precoPor: 199, categoria: categoryMock)
        let invalidProductMock = ProductEntity(id: nil, nome: nil, descricao: nil, urlImagem: nil, precoDe: nil, precoPor: nil, categoria: nil)
        let listMock = ListEntity(data: [productMock, invalidProductMock], offset: 0, total: 0)
        self.presenter.processBestSellers(listMock)
    }

}

private class MockedView: HomeViewControllerProtocol {
    func alertError(_ message: String) {}
    
    func presentBanner(_ viewModel: BannerViewModel) {
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.urlList.count, 1)
    }
    
    func presentCategoryList(_ viewModel: CategoryListViewModel) {
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.categoryList.count, 1)
    }
    
    func presentBestSellers(_ viewModelList: [BestSellerViewModel]) {
        XCTAssertNotNil(viewModelList)
        XCTAssertEqual(viewModelList.count, 1)
    }
    
    func setInteractor(_ abstractInteractor: DKAbstractInteractor) {}
}

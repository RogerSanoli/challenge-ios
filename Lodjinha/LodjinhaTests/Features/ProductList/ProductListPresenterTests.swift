//
//  ProductListPresenterTests.swift
//  LodjinhaTests
//
//  Created by Roger Sanoli on 10/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import XCTest
@testable import Lodjinha
@testable import DungeonKit

class ProductListPresenterTests: XCTestCase {

    private var presenter: ProductListPresenter!
    fileprivate var view: MockedView!
    
    override func setUp() {
        presenter = ProductListPresenter()
        view = MockedView()
        presenter.setView(view)
    }
    
    override func tearDown() {
        presenter = nil
        view = nil
    }

    func testProductListViewModel() {
        let categoryMock = CategoryEntity(id: 1, descricao: "Games", urlImagem: "http://google.com")
        let productMock = ProductEntity(id: 1, nome: "Zelda: Breath of the Wild", descricao: "Melhor jogo ever", urlImagem: "http://google.com", precoDe: 1000000, precoPor: 199, categoria: categoryMock)
        let invalidProductMock = ProductEntity(id: nil, nome: nil, descricao: nil, urlImagem: nil, precoDe: nil, precoPor: nil, categoria: nil)
        let listMock = ListEntity(data: [productMock, invalidProductMock], offset: 0, total: 0)
        self.presenter.processProducts(listMock, hasMore: true)
    }

}

private class MockedView: ProductListViewControllerProtocol {
    func alertError(_ message: String) {}
    
    func presentProductList(_ viewModelList: [ProductViewModel], hasMore: Bool) {
        XCTAssertNotNil(viewModelList)
        XCTAssertNotNil(hasMore)
        XCTAssertEqual(viewModelList.count, 1)
    }
    
    func setInteractor(_ abstractInteractor: DKAbstractInteractor) {}
}

//
//  ProductDetailPresenter.swift
//  LodjinhaTests
//
//  Created by Roger Sanoli on 10/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import XCTest
@testable import Lodjinha
@testable import DungeonKit

class ProductDetailPresenterTests: XCTestCase {
    
    private var presenter: ProductDetailPresenter!
    fileprivate var view: MockedView!

    override func setUp() {
        presenter = ProductDetailPresenter()
        view = MockedView()
        presenter.setView(view)
    }
    
    override func tearDown() {
        presenter = nil
        view = nil
    }

    func testProductDetailViewModel() {
        let categoryMock = CategoryEntity(id: 1, descricao: "Games", urlImagem: "http://google.com")
        let productMock = ProductEntity(id: 1, nome: "Zelda: Breath of the Wild", descricao: "Melhor jogo ever", urlImagem: "http://google.com", precoDe: 1000000, precoPor: 199, categoria: categoryMock)
        self.presenter.processProduct(productMock)
    }
    
    func testProductDetailReserve() {
        view.lockButtonPromise = expectation(description: "Calls view to lock reserve button")
        view.reservePromise = expectation(description: "Alert successful reservation")
        self.presenter.lockReservation()
        self.presenter.processProductReserved()
        self.wait(for: [view.lockButtonPromise!, view.reservePromise!], timeout: 5)
    }
}

private class MockedView: ProductDetailViewControllerProtocol {
    
    public var reservePromise: XCTestExpectation?
    public var lockButtonPromise: XCTestExpectation?
    
    func presentProduct(_ viewModel: ProductDetailViewModel) {
        XCTAssertNotNil(viewModel)
    }
    
    func lockReserveButton() {
        lockButtonPromise?.fulfill()
    }
    
    func alertProductReserved() {
        reservePromise?.fulfill()
    }
    
    func alertError(_ message: String) {}
    func setInteractor(_ abstractInteractor: DKAbstractInteractor) {}
}

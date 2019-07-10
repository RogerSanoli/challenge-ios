//
//  ProductListInteractorTests.swift
//  LodjinhaTests
//
//  Created by Roger Sanoli on 10/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import XCTest
@testable import Lodjinha
@testable import DungeonKit

class ProductListInteractorTests: XCTestCase {

    private let timeout = 60.0
    
    private var interactor: ProductListInteractor!
    fileprivate var presenter: MockedPresenter!
    
    override func setUp() {
        interactor = ProductListInteractor()
        presenter = MockedPresenter()
        interactor.setPresenter(presenter)
    }
    
    override func tearDown() {
        interactor = nil
        presenter = nil
    }
    
    func testLoadProductList() {
        let mockedCategoryID = 1
        presenter.promise = expectation(description: "Generates a page of ProductEntity")
        interactor.loadNextPage(mockedCategoryID)
        self.wait(for: [presenter.promise!], timeout: timeout)
    }
}

private class MockedPresenter: ProductListPresenterProtocol {
    
    public var promise: XCTestExpectation?
    
    func requestFailed(_ error: Error) {
        XCTFail("Request Failed. Error: \(error.localizedDescription)")
    }
    
    func processProducts(_ productList: ListEntity<ProductEntity>, hasMore: Bool) {
        XCTAssertNotNil(productList)
        promise?.fulfill()
    }
    
    func setView(_ abstractView: DKAbstractView) {}
}

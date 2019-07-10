//
//  ProductDetailInteractorTests.swift
//  LodjinhaTests
//
//  Created by Roger Sanoli on 10/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import XCTest
@testable import Lodjinha
@testable import DungeonKit

class ProductDetailInteractorTests: XCTestCase {
    
    private let timeout = 60.0
    
    private var interactor: ProductDetailInteractor!
    fileprivate var presenter: MockedPresenter!
    
    override func setUp() {
        interactor = ProductDetailInteractor()
        presenter = MockedPresenter()
        interactor.setPresenter(presenter)
    }
    
    override func tearDown() {
        interactor = nil
        presenter = nil
    }
    
    func testLoadDetail() {
        let mockedProductID = 1
        presenter.loadDetailPromise = expectation(description: "Generates a ProductEntity")
        interactor.loadProduct(productID: mockedProductID)
        self.wait(for: [presenter.loadDetailPromise!], timeout: timeout)
    }
    
    func testReserve() {
        let mockedProductID = 1
        presenter.reservePromise = expectation(description: "Successfully calls reserve endpoint")
        presenter.lockButtonPromise = expectation(description: "Calls presenter to lock reserve button")
        interactor.reserveProduct(productID: mockedProductID)
        self.wait(for: [presenter.lockButtonPromise!, presenter.reservePromise!], timeout: timeout)
    }
}

private class MockedPresenter: ProductDetailPresenterProtocol {
    
    public var loadDetailPromise: XCTestExpectation?
    public var reservePromise: XCTestExpectation?
    public var lockButtonPromise: XCTestExpectation?
    
    func requestFailed(_ error: Error) {
        XCTFail("Request Failed. Error: \(error.localizedDescription)")
    }
    
    func processProduct(_ product: ProductEntity) {
        XCTAssertNotNil(product)
        loadDetailPromise?.fulfill()
    }
    
    func lockReservation() {
        lockButtonPromise?.fulfill()
    }
    
    func processProductReserved() {
        reservePromise?.fulfill()
    }
    
    func setView(_ abstractView: DKAbstractView) {}
}

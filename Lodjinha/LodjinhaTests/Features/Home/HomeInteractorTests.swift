//
//  HomeInteractorTests.swift
//  LodjinhaTests
//
//  Created by Roger Sanoli on 10/07/19.
//  Copyright © 2019 RogerSanoli. All rights reserved.
//

import XCTest
@testable import Lodjinha
@testable import DungeonKit

class HomeInteractorTests: XCTestCase {

    private let timeout = 60.0
    
    private var interactor: HomeInteractor!
    fileprivate var presenter: MockedPresenter!
    
    override func setUp() {
        interactor = HomeInteractor()
        presenter = MockedPresenter()
        interactor.setPresenter(presenter)
    }

    override func tearDown() {
        interactor = nil
        presenter = nil
    }

    func testBanners() {
        presenter.promise = expectation(description: "Generates a BannerEntity array")
        interactor.loadBanners()
        self.wait(for: [presenter.promise!], timeout: timeout)
    }
    
    func testCategories() {
        presenter.promise = expectation(description: "Generates a CategoryEntity array")
        interactor.loadCategories()
        self.wait(for: [presenter.promise!], timeout: timeout)
    }
    
    func testBestSellers() {
        presenter.promise = expectation(description: "Generates a ProductEntity array")
        interactor.loadBestSellers()
        self.wait(for: [presenter.promise!], timeout: timeout)
    }

}

private class MockedPresenter: HomePresenterProtocol {
    
    public var promise: XCTestExpectation?
    
    func requestFailed(_ error: Error) {
        XCTFail("Request Failed. Error: \(error.localizedDescription)")
    }
    
    func processBanners(_ bannerList: ListEntity<BannerEntity>) {
        XCTAssertNotNil(bannerList)
        promise?.fulfill()
    }
    
    func processCategories(_ categoryList: ListEntity<CategoryEntity>) {
        XCTAssertNotNil(categoryList)
        promise?.fulfill()
    }
    
    func processBestSellers(_ bestSellerList: ListEntity<ProductEntity>) {
        XCTAssertNotNil(bestSellerList)
        promise?.fulfill()
    }
    
    func setView(_ abstractView: DKAbstractView) {}
}

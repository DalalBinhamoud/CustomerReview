//
//  DeersAppTests.swift
//  DeersAppTests
//
//  Created by Dalal Macbook on 24/07/2022.
//

import XCTest

class DeersAppTests: XCTestCase {
    
    func test_example (){
        let sut = ReviewsViewModel()
        sut.addReview(status: "good", note: "test")
        XCTAssertEqual("10", "10")
    }



}

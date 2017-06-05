//
//  TransitiveDependenciesTests.swift
//  TransitiveDependenciesTests
//
//  Created by Michelline Tran on 5/10/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import XCTest
@testable import TransitiveDependencies

class TransitiveDependenciesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testBasic() {
        let dep = Dependencies()
        dep.addDirect(node: "A", dependencies: ["B", "C"])
        let actual = dep.dependenciesFor(node: "A")
        let expected = ["B", "C"]

        XCTAssertEqual(expected, actual)

    }

    func testTwo(){
        let dep = Dependencies()
        dep.addDirect(node: "B", dependencies: ["C", "E"])
        let actual = dep.dependenciesFor(node: "B")
        let expected = ["C", "E"]

        XCTAssertEqual(expected, actual)
    }

    func testTransitive(){
        let dep = Dependencies()
        dep.addDirect(node: "A", dependencies: ["B","C"])
        dep.addDirect(node: "B", dependencies: ["C", "E"])
        let actual = dep.dependenciesFor(node: "A")
        let expected = ["B", "C", "E"]

        XCTAssertEqual(expected, actual)
    }

    func testTwoLayersOfTransitivity(){
        let dep = Dependencies()
        dep.addDirect(node: "A", dependencies: ["B","C"])
        dep.addDirect(node: "B", dependencies: ["C", "E"])
        dep.addDirect(node: "E", dependencies: ["F"])
        let actual = dep.dependenciesFor(node: "A")
        let expected = ["B", "C", "E", "F"]

        XCTAssertEqual(expected, actual)
    }

//    func testLotsOfTransitivity(){
//        
//        let dep = Dependencies()
//        dep.addDirect(node: "A", dependencies: ["B","C", "D", "J", "H", "I", "J", "K", "L", "M", "X"])
//        dep.addDirect(node: "B", dependencies: ["C", "E"])
//        dep.addDirect(node: "E", dependencies: ["F"])
//        dep.addDirect(node: "L", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O", "Y"])
//        dep.addDirect(node: "J", dependencies: ["M","I", "C", "H", "A", "E"])
//        dep.addDirect(node: "Z", dependencies: ["B","C", "D", "J", "H", "I", "J", "K", "L", "M"])
//        dep.addDirect(node: "Y", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O"])
//        dep.addDirect(node: "X", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O", "Z"])
//
//
//        let actual = dep.dependenciesFor(node: "A")
//        let expected = ["B", "C", "E", "F"]
//
//        //XCTAssertEqual(expected, actual)
//    }

    func testLotsOfTransitivity(){

        self.measure {
            let dep = Dependencies()
            dep.addDirect(node: "A", dependencies: ["B","C", "D", "J", "H", "I", "J", "K", "L", "M", "X", "W"])
            dep.addDirect(node: "B", dependencies: ["C", "E"])
            dep.addDirect(node: "E", dependencies: ["F"])
            dep.addDirect(node: "L", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O", "Y"])
            dep.addDirect(node: "J", dependencies: ["M","I", "C", "H", "A", "E"])
            dep.addDirect(node: "Z", dependencies: ["B","C", "D", "J", "H", "I", "J", "K", "L", "M"])
            dep.addDirect(node: "Y", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O"])
            dep.addDirect(node: "X", dependencies: ["M","I", "C", "H", "A", "E", "L", "K", "T", "O", "Z"])

            let nums = 1...10000
            let deps = nums.map { (num) -> String in
                return String(num)
            }
            dep.addDirect(node: "W", dependencies: deps)


            let actual = dep.dependenciesFor(node: "A")
            let expected = ["B", "C", "E", "F"]
        }

        //XCTAssertEqual(expected, actual)
    }

}

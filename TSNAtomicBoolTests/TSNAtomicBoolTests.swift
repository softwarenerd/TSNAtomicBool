//
//  TSNAtomicBoolTests.swift
//  TSNAtomicBoolTests
//
//  Created by Brian Lambert on 10/14/15.
//

import XCTest
@testable import TSNAtomicBool

// TSNAtomicBoolTests class.
class TSNAtomicBoolTests: XCTestCase
{
    // Set up.
    override func setUp()
    {
        super.setUp()
    }
    
    // Tear down.
    override func tearDown()
    {
        super.tearDown()
    }
    
    func test_Init()
    {
        let atomicBool = TSNAtomicBool();
        XCTAssertFalse(atomicBool.boolValue)
        XCTAssertTrue(atomicBool.trySetTrue())
    }
    
    func test_InitToTrue()
    {
        let atomicBool = TSNAtomicBool(true);
        XCTAssertTrue(atomicBool.boolValue)
        XCTAssertTrue(atomicBool.trySetFalse())
    }
    
    func test_InitToFalse()
    {
        let atomicBool = TSNAtomicBool(false);
        XCTAssertFalse(atomicBool.boolValue)
        XCTAssertTrue(atomicBool.trySetTrue())
    }

    func test_trySetTrue()
    {
        let atomicBool = TSNAtomicBool();
        XCTAssertTrue(atomicBool.trySetTrue())      // Should work.
        XCTAssertFalse(atomicBool.trySetTrue())     // Shouldn't work.
        XCTAssertTrue(atomicBool.boolValue)         // The boolValue should be true.
        XCTAssertTrue(atomicBool == true)           // == this way.
        XCTAssertTrue(true == atomicBool)           // == that way.
        XCTAssertTrue(atomicBool != false)          // != this way.
        XCTAssertTrue(false != atomicBool)          // != that way.
    }

    func test_trySetFalse()
    {
        let atomicBool = TSNAtomicBool();
        atomicBool.trySetTrue();
        XCTAssertTrue(atomicBool.trySetFalse())
        XCTAssertFalse(atomicBool.boolValue)
        XCTAssertTrue(atomicBool == false)          // == this way.
        XCTAssertTrue(false == atomicBool)          // == that way.
        XCTAssertTrue(atomicBool != true)           // != this way.
        XCTAssertTrue(true != atomicBool)           // != that way.
    }    
}

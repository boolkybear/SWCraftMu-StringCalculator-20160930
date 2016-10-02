//
//  KataStringCalculatorTests.swift
//  KataStringCalculatorTests
//
//  Created by Boolky Bear on 30/9/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import XCTest
@testable import KataStringCalculator

class KataStringCalculatorTests: XCTestCase {
	
	func testEmptyString() {
		let calculator = StringCalculator()
		let result = calculator.add("")
		
		XCTAssert(result == 0)
	}
	
	func testSingleNumber() {
		let calculator = StringCalculator()
		let result = calculator.add("1")
		
		XCTAssert(result == 1)
	}
	
	func testTwoNumbers() {
		let calculator = StringCalculator()
		let result = calculator.add("1,2")
		
		XCTAssert(result == 3)
	}
	
	func testThreeNumbers() {
		let calculator = StringCalculator()
		let result = calculator.add("1,2,3")
		
		XCTAssert(result == 6)
	}
	
	func testFiveNumbers() {
		let calculator = StringCalculator()
		let result = calculator.add("1,2,3,4,5")
		
		XCTAssert(result == 15)
	}
	
	func testThreeNumbersWithLineFeed() {
		let calculator = StringCalculator()
		let result = calculator.add("1\n2,3")
		
		XCTAssert(result == 6)
	}
	
	func testCustomDelimiter() {
		let calculator = StringCalculator()
		let result = calculator.add("//;\n1;2\n3")
		
		XCTAssert(result == 6, "\(result) != 6")
	}
	
	func testNegativeNumbers() {
		let calculator = StringCalculator()
		let result = calculator.add("1,-2\n3")
		
		XCTAssert(result == -1)
	}
	
	func testNumbersTooBig() {
		let calculator = StringCalculator()
		let result = calculator.add("1,1001\n3")
		
		XCTAssert(result == 4)
	}
}

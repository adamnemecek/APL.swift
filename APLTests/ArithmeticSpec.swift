//
//  ArithmeticSpec.swift
//  APL
//
//  Created by Robert Widmann on 7/14/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import APL
import XCTest

public class ArithmeticSpec : XCTestCase {
// It's rather ambiguous as to what Swift does with unary plus.  All indications point to it being
// absolute value, but even that fails.  C defines it as a way to promote operands, but that makes
// no sense here given that it would be a pretty clear violation of type safety/obviates @conversion.
// It seems like a NOP for now, which is a shame.
//
//    public func testMate() {
//        let x = 5.0
//        let y = -5.0
//        
//        XCTAssertEqual((+x), x, "")
//        XCTAssertEqual((+y), fabs(y), "")
//    }
	
	public func testMonadMinus() {
		let x = 5.0
		let y = -5.0
		
		XCTAssertEqual(-x, 0-x, "")
		XCTAssertEqual(-y, 0-y, "")
	}
	
	public func testMonadTrend() {
		let x = 5.0
		let y = -5.0
		
		XCTAssertEqual(×x, 1.0, "")
		XCTAssertEqual(×y, -1.0, "")
	}
	
	public func testMonadPer() {
		let x = 5.0
		let y = -5.0
		
		XCTAssertEqual(÷x, 1.0/x, "")
		XCTAssertEqual(÷y, 1.0/y, "")
	}
	
	public func testDyadPlus() {
		XCTAssertEqual(1.0 + 1.0, 2.0, "")
	}
	
	public func testDyadMinus() {
		XCTAssertEqual(1.0 - 1.0, 0.0, "")
	}
	
	public func testDyadTimes() {
		let x = 5.0
		let y = 5.0
		
		XCTAssertEqual(x × y, exp(log(x) - log(1.0 / y)), "")
	}
	
	public func testDyadPer() {
		let x = 5.0
		let y = -5.0
		
		XCTAssertEqual(x ÷ y, x / y, "")
	}
	
	public func testMonadPower() {
		let x = 5.0
		let y = -5.0
		
		XCTAssertEqual(**x, exp(x), "")
		XCTAssertEqual(**y, exp(y), "")
	}
	
	public func testMonadLog() {
		let x = 5.0

		XCTAssertEqual(⍟x, log(x), "")
	}
	
	public func testDyadPower() {
		let x = 5.0
		let y = 5.0
		
		XCTAssertEqual(x ** y, exp(y × log(x)), "")
	}
	
	public func testDyadLog() {
		let x = 5.0
		let b = 5.0

		XCTAssertEqual(x ⍟ b, exp(b) ** log(x), "")
	}
	
	public func testMonadFactorial() {
		var acc : Double = 1.0
		for i in [1.0, 2.0, 3.0, 4.0] {
			acc *= i
		}
		
		XCTAssertEqual(!4, acc, "")
	}

	public func testDyadAntibase() {
		let x : UInt = 1025
		let y : UInt = 15

		XCTAssertEqual(x⊤y, 5.0, "")
	}
}

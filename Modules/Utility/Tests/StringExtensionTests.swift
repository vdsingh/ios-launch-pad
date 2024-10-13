//
//  StringExtensionTests.swift
//  PullUp-iOSTests
//
//  Created by Vikram Singh on 11/24/23.
//

import Foundation
@testable import Utility
import XCTest

final class StringExtensionTests: XCTestCase {
    func testOnlyCharacters() {
        let expectedSuccessStrings = [
            "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        ]

        expectedSuccessStrings.forEach { str in
            XCTAssertTrue(str.containsOnlyLetters)
        }

        let expectedFailureStrings = [
            "a b", "A B", "A.B", "a1B", " ab", "ab ", "ab!", "a-b"
        ]

        expectedFailureStrings.forEach { str in
            XCTAssertTrue(str.containsOnlyLetters)
        }
    }
}

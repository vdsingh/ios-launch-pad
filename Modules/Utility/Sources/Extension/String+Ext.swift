//
//  String+Ext.swift
//  PullUp-iOS
//
//  Created by Vikram Singh on 11/12/23.
//

import Foundation

public extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var containsOnlyLetters: Bool {
        let letterCharacterSet = CharacterSet.letters
        let onlyLetters = self.unicodeScalars.allSatisfy { letterCharacterSet.contains($0) }
        return onlyLetters
    }
}

//
//  StringCalculator.swift
//  KataStringCalculator
//
//  Created by Boolky Bear on 30/9/16.
//  Copyright © 2016 ByBDesigns. All rights reserved.
//

import Foundation

class StringCalculator {
	
	init() {
	}
	
	func add(numbers: String) -> Int {
		if numbers.characters.count == 0 {
			return 0
		} else {
			let canonicDelimiter = ","
			let canonicNumbers = convertToCanonicalString(numbers, separatedBy: canonicDelimiter)
			let operands = canonicNumbers.componentsSeparatedByString(canonicDelimiter)
			var accumulated = 0
			for item in operands {
				let integerValue = NSString(string: item).integerValue
				if integerValue < 1000 {
					if(integerValue < 0) {
						print("Negatives not allowed - \(integerValue)")
						return -1
					}
					
					accumulated += integerValue
				}
			}
			
			return accumulated
		}
	}
	
	private func convertToCanonicalString(numbers: String, separatedBy separator: String) -> String {
		var delimiters = ["\n"]
		var numberString = numbers
		if numbers.hasPrefix("//") {
			let delimiter = String(numbers.characters[numbers.characters.startIndex.advancedBy(2)])
			delimiters.append(delimiter)
			
			numberString = numbers.substringFromIndex(numbers.characters.startIndex.advancedBy(4))
		}
		
		for delimiter in delimiters {
			numberString = numberString.stringByReplacingOccurrencesOfString(delimiter, withString: separator)
		}
		
		return numberString
	}
	
}

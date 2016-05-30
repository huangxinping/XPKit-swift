//
//  Dictionary+XPKit.swift
//  XPKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

/// This extension adds some useful functions to NSDictionary
public extension Dictionary {
	// MARK: - Instance functions -

	/**
	 Convert self to JSON as String

	 - returns: Returns the JSON as String or nil if error while parsing
	 */
	func dictionaryToJSON() throws -> String {
		return try Dictionary.dictionaryToJSON(self as! AnyObject)
	}

	// MARK: - Class functions -

	/**
	 Convert the given dictionary to JSON as String

	 - parameter dictionary: The dictionary to be converted

	 - returns: Returns the JSON as String or nil if error while parsing
	 */
	static func dictionaryToJSON(dictionary: AnyObject) throws -> String {
		var json: NSString
		let jsonData: NSData = try NSJSONSerialization.dataWithJSONObject(dictionary, options: .PrettyPrinted)

		if jsonData == false {
			return "{}"
		} else {
			json = NSString(data: jsonData, encoding: NSUTF8StringEncoding)!
			return json as String
		}
	}

	// var doubleValue:Double? = myDistionary.parse("someKeyForDouble")
	public func parse<T>(key: Key) -> T? {

		let result = self[key]
		if (result is T) {
			return result as? T
		}

		return nil
	}

	public func containsKey(key: Key) -> Bool {
		return self[key] != nil
	}

	init(dictionary: Dictionary<Key, Value>) {
		self.init(minimumCapacity: dictionary.count)
		add(dictionary)
	}

	public mutating func add(dictionary: Dictionary<Key, Value>) {
		for (key, value) in dictionary {
			self[key] = value
		}
	}

	public func apend(dictionary: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		var selfCopy = Dictionary(dictionary: self)
		selfCopy.add(dictionary)
		return selfCopy
	}

	public mutating func removeKeys < KeysSequenceType: SequenceType where KeysSequenceType.Generator.Element == Key > (keysToRemove: KeysSequenceType) -> Int {
		var removedCount = 0
		var generator = keysToRemove.generate()
		while let key: Key = generator.next() {
			if self.removeValueForKey(key) != nil {
				removedCount += 1
			}
		}
		return removedCount
	}

}

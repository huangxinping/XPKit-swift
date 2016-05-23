//
//  NSMutableString+XPKit.swift
//  XPKit-swift
//
//  Created by xinpinghuang on 5/23/16.
//  Copyright © 2016 huangxinping. All rights reserved.
//

import Foundation

/// This extension adds some useful functions to NSMutableString
extension NSMutableString {

	// MARK: - Instance fucntions -

	/**
	 Replace string

	 - parameter searchString: search string
	 - parameter replacement:  replace ment
	 */
	public func replaceOccurencesOfString(searchString: String, replacement: String) {
		self.replaceOccurrencesOfString(searchString, withString: replacement, options: .CaseInsensitiveSearch, range: NSMakeRange(0, self.length))
	}

}

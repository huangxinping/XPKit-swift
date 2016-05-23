//
//  XPApp.swift
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
import UIKit

/// Get App name
public let APP_NAME: String = NSBundle(identifier: "com.iiseeuu.xpkit-swift")!.infoDictionary!["CFBundleDisplayName"] as! String

/// Get App build
public let APP_BUILD: String = NSBundle(identifier: "com.iiseeuu.xpkit-swift")!.infoDictionary!["CFBundleVersion"] as! String

/// Get App version
public let APP_VERSION: String = NSBundle(identifier: "com.iiseeuu.xpkit-swift")!.infoDictionary!["CFBundleShortVersionString"] as! String

/// ShortHand
public func ccr(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
	return CGRectMake(x, y, width, height)
}

public func ccp(x: CGFloat, y: CGFloat) -> CGPoint {
	return CGPointMake(x, y)
}

public func ccs(width: CGFloat, height: CGFloat) -> CGSize {
	return CGSizeMake(width, height)
}

public func ccei(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> UIEdgeInsets {
	return UIEdgeInsetsMake(top, left
		, bottom, right)
}

/**
 Use XPLocalizedString to use the string translated by XPKit

 - parameter key:     The key string
 - parameter comment: An optional comment

 - returns: Returns the localized string
 */
public func XPLocalizedString(key: String, _ comment: String? = nil) -> String {
	return NSBundle(identifier: "com.iiseeuu.xpkit-swift")!.localizedStringForKey(key, value: key, table: "XPKit")
}

/// Get AppDelegate (To use it, cast to AppDelegate with "as! AppDelegate")
public let APP_DELEGATE: UIApplicationDelegate? = UIApplication.sharedApplication().delegate
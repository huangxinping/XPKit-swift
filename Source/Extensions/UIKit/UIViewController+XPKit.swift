//
//  UIViewController+XPKit.swift
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

/// This extesion adds some useful functions to UIViewController
public extension UIViewController {

	// MARK: - Class functions -

	public class func viewControllerWithStoryboardName(stroryboardName: String, viewCotrollerIdentifier: String) -> UIViewController {
		let storyboard = UIStoryboard(name: stroryboardName, bundle: NSBundle.mainBundle())
		return storyboard.instantiateViewControllerWithIdentifier(viewCotrollerIdentifier)
	}

	class func topMostController() -> UIViewController {

		var topController = UIApplication.sharedApplication().keyWindow!.rootViewController

		while ((topController!.presentedViewController) != nil) {

			topController = topController!.presentedViewController;
		}

		return topController!
	}

}

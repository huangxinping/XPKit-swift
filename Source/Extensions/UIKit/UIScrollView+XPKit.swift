//
//  UIScrollView+XPKit.swift
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

/// This extesion adds some useful functions to UIScrollView
public extension UIScrollView {

	// MARK: - Instance functions -

	/**
	 Location offset to top

	 - parameter animated: aniamted
	 */
	public func scrollToTop(animated: Bool = true) {
		self.setContentOffset(ccp(0, y: 0), animated: animated)
	}

	/**
	 Location offset to some view visible

	 - parameter view:     view
	 - parameter animated: animated
	 */
	public func scrollViewToVisible(view: UIView, animated: Bool = true) {
		var needsUpdate = false

		let frame = self.window?.convertRect(self.frame, fromView: self.superview)

		let viewFrame = self.window?.convertRect(view.frame, fromView: view.superview)

		let viewMaxX = viewFrame!.origin.x + viewFrame!.size.width
		let viewMaxY = viewFrame!.origin.y + viewFrame!.size.height
		let scrollViewMaxX = frame!.origin.x + frame!.size.width
		let scrollViewMaxY = frame!.origin.y + frame!.size.height

		var offsetPoint = self.contentOffset
		if (viewMaxX > scrollViewMaxX) {
			// The view is to the right of the view port, so scroll it just into view
			offsetPoint.x = frame!.origin.x + viewFrame!.size.width
			needsUpdate = true;
		}
		else if (viewMaxX < 0.0) {
			offsetPoint.x = viewFrame!.origin.x
			needsUpdate = true;
		}

		if (viewMaxY > scrollViewMaxY) {
			// The view is below the view port, so scroll it just into view
			offsetPoint.y = frame!.origin.y + viewFrame!.size.height
			needsUpdate = true
		}
		else if (viewMaxY < 0.0) {
			offsetPoint.y = viewFrame!.origin.y
			needsUpdate = true
		}

		if (needsUpdate) {
			offsetPoint = (self.window?.convertPoint(offsetPoint, toView: self.superview))!
			self.setContentOffset(offsetPoint, animated: animated)
			CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.2, false);
		}
	}

	// MARK: - Init functions -

	/**
	 Create an UIScrollView and set some parameters

	 - parameter frame:                ScrollView's frame
	 - parameter contentSize:          ScrollView's content size
	 - parameter clipsToBounds:        Set if ScrollView has to clips to bounds
	 - parameter pagingEnabled:        Set if ScrollView has paging enabled
	 - parameter showScrollIndicators: Set if ScrollView has to show the scroll indicators, vertical and horizontal
	 - parameter delegate:             ScrollView's delegate

	 - returns: Returns the created UIScrollView
	 */
	public convenience init(frame: CGRect, contentSize: CGSize, clipsToBounds: Bool, pagingEnabled: Bool, showScrollIndicators: Bool, delegate: UIScrollViewDelegate?) {
		self.init(frame: frame)
		self.delegate = delegate
		self.pagingEnabled = pagingEnabled
		self.clipsToBounds = clipsToBounds
		self.showsVerticalScrollIndicator = false
		self.showsHorizontalScrollIndicator = false
		self.contentSize = contentSize
	}
}

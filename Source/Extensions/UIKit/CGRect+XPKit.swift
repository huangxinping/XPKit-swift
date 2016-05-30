//
//  CGRect+XPkit.swift
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

import UIKit

public extension CGRect {

	init(original: CGRect) {
		self.init(origin: original.origin, size: original.size)
	}

	init(origin: CGPoint, size: CGSize) {
		self.origin = origin
		self.size = size
	}

	var x: CGFloat {
		get {
			return origin.x
		}
		set (value) {
			origin.x = value
		}
	}

	var y: CGFloat {
		get {
			return origin.y
		}
		set (value) {
			origin.y = value
		}
	}

	var width: CGFloat {
		get {
			return size.width
		}
		set (value) {
			size.width = value
		}
	}

	var height: CGFloat {
		get {
			return size.height
		}
		set (value) {
			size.height = value
		}
	}

	var topRight: CGPoint {
		return CGPointMake(x + width, y)
	}

	var topLeft: CGPoint {
		return origin
	}

	var bottomRight: CGPoint {
		return CGPointMake(x + width, y + height)
	}

	var bottomLeft: CGPoint {
		return CGPointMake(x, y + height)
	}

	var centre: CGPoint {
		get {
			return CGPointMake(x + width / 2, y + height / 2)
		}
		set (value) {
			origin = CGPoint(x: value.x - size.width / 2, y: value.y - size.height / 2)
		}
	}

	func rectWithTopEdge(topEdge: CGFloat) -> CGRect {
		return rectBySizingTop(y - topEdge)
	}

	func rectWithRightEdge(rightEdge: CGFloat) -> CGRect {
		return rectBySizingRight(rightEdge - self.maxX)
	}

	func rectWithBottomEdge(bottomEdge: CGFloat) -> CGRect {
		return rectBySizingBottom(bottomEdge - self.maxY)
	}

	func rectWithLeftEdge(leftEdge: CGFloat) -> CGRect {
		return rectBySizingLeft(x - leftEdge)
	}

	func rectWithZeroOrigin() -> CGRect {
		return self - origin
	}

	func rectWithOrigin(newOrigin: CGPoint) {

	}

	func rectWithCentre(newCentre: CGPoint) -> CGRect {
		var rect = CGRect(original: self)
		rect.centre = newCentre
		return rect
	}

	func rectBySizingTop(extendBy: CGFloat) -> CGRect {
		return self.rectByInsetting(-extendBy, left: 0, bottom: 0, right: 0)
	}

	mutating func sizeTop(extendBy: CGFloat) {
		inset(-extendBy, left: 0, bottom: 0, right: 0)
	}

	func rectBySizingBottom(extendBy: CGFloat) -> CGRect {
		return self.rectByInsetting(0, left: 0, bottom: -extendBy, right: 0)
	}

	mutating func sizeBottom(extendBy: CGFloat) {
		height += extendBy
	}

	func rectBySizingLeft(extendBy: CGFloat) -> CGRect {
		return self.rectByInsetting(0, left: -extendBy, bottom: 0, right: 0)
	}

	mutating func sizeLeft(extendBy: CGFloat) {
		inset(0, left: -extendBy, bottom: 0, right: 0)
	}

	func rectBySizingRight(extendBy: CGFloat) -> CGRect {
		return self.rectByInsetting(0, left: 0, bottom: 0, right: -extendBy)
	}

	mutating func sizeRight(extendBy: CGFloat) {
		width += extendBy
	}

	func rectByInsetting(edgeInsets: UIEdgeInsets) -> CGRect {
		return UIEdgeInsetsInsetRect(self, edgeInsets)
	}

	func rectByInsetting(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> CGRect {
		return rectByInsetting(UIEdgeInsetsMake(top, left, bottom, right))
	}

	mutating func inset(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
		x += left
		y += top
		width -= left + right
		height -= top + bottom
	}

	func rectByInsetting(top: Double, left: Double, bottom: Double, right: Double) -> CGRect {
		return rectByInsetting(CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right))
	}

	func rectByInsetting(colapseBy: CGFloat) -> CGRect {
		return rectByInsetting(colapseBy, left: colapseBy, bottom: colapseBy, right: colapseBy)
	}

	func rectByOffsetting(vectorPoint: CGPoint) -> CGRect {
		return self.offsetBy(dx: vectorPoint.x, dy: vectorPoint.y)
	}

	mutating func offset(vector: CGPoint) {
		x += vector.x
		y += vector.y
	}

	func hasOvelappingArea(withRect: CGRect) -> Bool {
		return maxX > withRect.minX && minX < withRect.maxX && maxY > withRect.minY && minY < withRect.maxY
	}
}

public func - (left: CGRect, right: CGPoint) -> CGRect {
	return left.rectByOffsetting(-right)
}

public func + (left: CGRect, right: CGPoint) -> CGRect {
	return left.rectByOffsetting(right)
}
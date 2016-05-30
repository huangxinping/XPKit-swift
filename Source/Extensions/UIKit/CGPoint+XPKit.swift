//
//  CGPoint+XPKit.swift
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

public extension CGPoint {

	public var distanceToOrigin: CGFloat {
		return self.distanceTo(CGPointZero)
	}

	public func distanceTo(other: CGPoint) -> CGFloat {
		let xDist = x - other.x
		let yDist = y - other.y
		return sqrt(xDist * xDist + yDist * yDist)
	}

	public func pointByOffsetting(dx: CGFloat, dy: CGFloat) -> CGPoint {
		return CGPoint(x: x + dx, y: y + dy)
	}
}

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
	return left.pointByOffsetting(right.x, dy: right.y)
}

public prefix func - (point: CGPoint) -> CGPoint {
	return CGPointZero - point
}

public func - (left: CGPoint, right: CGPoint) -> CGPoint {
	return left.pointByOffsetting(-right.x, dy: -right.y)
}

public func * (point: CGPoint, multiplier: CGFloat) -> CGPoint {
	return CGPoint(x: point.x * multiplier, y: point.y * multiplier)
}

public func / (point: CGPoint, divider: CGFloat) -> CGPoint {
	return CGPoint(x: point.x / divider, y: point.y / divider)
}

public func += (inout target: CGPoint, addend: CGPoint) {
	target = target + addend
}

public func -= (inout target: CGPoint, subtrahend: CGPoint) {
	target = target - subtrahend
}

public func *= (inout target: CGPoint, multiplier: CGFloat) {
	target = target * multiplier
}

public func /= (inout target: CGPoint, divisor: CGFloat) {
	target = target / divisor
}

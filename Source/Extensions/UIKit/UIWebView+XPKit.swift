//
//  UIWebView+XPKit.swift
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

/// This extesion adds some useful functions to UIWebView
public extension UIWebView {
    // MARK: - Instance functions -
    
    /**
     Remove the background shadow of the UIWebView
     */
    public func removeBackgroundShadow() {
        for i in 0 ..< self.scrollView.subviews.count {
            let singleSubview: UIView = self.scrollView.subviews[i]
            if singleSubview.isKindOfClass(UIImageView.self) && singleSubview.frame.origin.x <= 500 {
                singleSubview.hidden = true
                singleSubview.removeFromSuperview()
            }
        }
    }
    
    /**
     Load the requested website
    
     - parameter website: Website to load
     */
    public func loadWebsite(website: String) {
        self.loadRequest(NSURLRequest(URL: NSURL(string: website)!))
    }
}

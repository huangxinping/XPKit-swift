//
//  UIApplication+XPKit.swift
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
import AudioToolbox

/// This extesion adds some useful functions to UIApplication
public extension UIApplication {

	// MARK: - Instance functions -

	/**
	 Set application status bar style

	 - parameter style:    style
	 - parameter animated: aniamted
	 */
	public func setApplicationStyle(style: UIStatusBarStyle, animated: Bool) {
		self.setStatusBarStyle(style, animated: animated)
		let newBackgroundColor = style == .Default ? UIColor.whiteColor() : UIColor.blackColor()
		let oldBackgroundColor = style == .Default ? UIColor.blackColor() : UIColor.whiteColor()
		if animated {
			CATransaction.setValue(NSNumber(double: 0.3), forKey: "kCATransactionAnimationDuration")
			let fadeAnimation = CABasicAnimation(keyPath: "backgroundColor")
			fadeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
			fadeAnimation.fromValue = oldBackgroundColor.CGColor
			fadeAnimation.toValue = newBackgroundColor.CGColor
			fadeAnimation.fillMode = kCAFillModeForwards
			fadeAnimation.removedOnCompletion = true
			self.keyWindow?.layer.addAnimation(fadeAnimation, forKey: "fadeAnimation")
			CATransaction.commit()
		} else {
			self.keyWindow!.backgroundColor = newBackgroundColor;
		}
	}

	/**
	 Send sock
	 */
	public func sendSock() {
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	}

	/**
	 Register background run model
	 */
	public func registerApplicationBackgroundRun() {
		let app = UIApplication.sharedApplication()
		var bgTask: UIBackgroundTaskIdentifier!
		bgTask = app.beginBackgroundTaskWithExpirationHandler { () -> Void in
			app.endBackgroundTask(bgTask)
			bgTask = UIBackgroundTaskInvalid
		}
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
			dispatch_async(dispatch_get_main_queue(), {
				app.endBackgroundTask(bgTask)
				bgTask = UIBackgroundTaskInvalid
			})
		}
	}

	/**
	 Set idle disable

	 - parameter disable: disable
	 */
	public func setIdleDisable(disable: Bool) {
		UIApplication.sharedApplication().idleTimerDisabled = disable
	}
}

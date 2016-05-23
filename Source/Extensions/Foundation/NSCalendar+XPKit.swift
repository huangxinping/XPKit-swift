//
//  NSCalendar+XPKit.swift
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

/// This extesion adds some useful functions to NSCalendar
public enum XPDayOfTheWeekType: Int {
	case Undefined
	case Sunday
	case Monday
	case Tuesday
	case Wednesday
	case Thursday
	case Friday
	case Saturday
}

extension NSCalendar {

	// MARK: - Class functions

	/**
	 calutator day name

	 - parameter year:  year
	 - parameter month: month
	 - parameter day:   day

	 - returns: The day name
	 */
	public class func dayOfTheWeekOnYear(year: NSInteger, month: NSInteger, day: NSInteger) -> XPDayOfTheWeekType {
		var tempYear = year
		var tempMonth = month
		if (tempYear > 1582) {
			if (tempMonth < 3) {
				tempYear -= 1;
				tempMonth += 12;
			}
			let val = (tempYear + (tempYear / 4) - (tempYear / 100) + (tempYear / 400)
					+ ((13 * tempMonth + 8) / 5) + day) % 7;
			switch val {
			case 0:
				return .Sunday
			case 1:
				return .Monday
			case 2:
				return .Tuesday
			case 3:
				return .Wednesday
			case 4:
				return .Thursday
			case 5:
				return .Friday
			case 6:
				return .Saturday
			default:
				return .Undefined
			}
		}
		return .Undefined
	}

	/**
	 Convert to name string

	 - parameter weekType: wday

	 - returns: The name
	 */
	public class func nameOfTheDayOfTheWeekType(weekType: XPDayOfTheWeekType) -> NSString {
		switch weekType {
		case .Undefined:
			return ""
		case .Sunday:
			return XPLocalizedString("SUNDAY")
		case .Monday:
			return XPLocalizedString("MONDAY")
		case .Tuesday:
			return XPLocalizedString("TUESDAY")
		case .Wednesday:
			return XPLocalizedString("WEDNESDAY")
		case .Thursday:
			return XPLocalizedString("THURSDAY")
		case .Friday:
			return XPLocalizedString("FRIDAY")
		case .Saturday:
			return XPLocalizedString("SATURDAY")
		}
	}

	public class func nameOfMonth(month: NSInteger) -> NSString {
		switch month {
		case 1:
			return XPLocalizedString("JANUARY")
		case 2:
			return XPLocalizedString("FEBRUARY")
		case 3:
			return XPLocalizedString("MARCH")
		case 4:
			return XPLocalizedString("APRIL")
		case 5:
			return XPLocalizedString("MAY")
		case 6:
			return XPLocalizedString("JUNE")
		case 7:
			return XPLocalizedString("JULY")
		case 8:
			return XPLocalizedString("AUGUST")
		case 9:
			return XPLocalizedString("SEPTEMBER")
		case 10:
			return XPLocalizedString("OCTOBER")
		case 11:
			return XPLocalizedString("NOVEMBER")
		case 12:
			return XPLocalizedString("DECEMBER")
		default:
			return ""
		}
	}
}
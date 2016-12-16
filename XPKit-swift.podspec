Pod::Spec.new do |s|
  s.name         = "XPKit-swift"
  s.version      = "1.0.0"
  s.summary      = "XPKit is a collection of useful classes to develop Apps faster"

  s.description  = <<-DESC
                   What does it do?
                   ================
                   XPKit adds some useful method to some classes.

                   ###Foundation:
                   - NSArray
				   - NSDate
				   - NSCalendar
				   - NSData
				   - NSDate
				   - NSDictionary
				   - NSMutableString
				   - NSObject
				   - NSTimer
				   - NSURLRequest
				   - NSUserDefaults
				   - NSFileManager
				   - NSMutableArray
				   - NSMutableDictionary
				   - NSNumber
				   - NSProcessInfo
				   - NSString

                   ###UIKit:
				   - UIActionSheet
				   - UIButton
				   - UIAlertView
				   - UIApplication
				   - UIControl
				   - UINavigationBar
				   - UINavigationController
				   - UIPickerView
				   - UIPopoverController
				   - UITableView
				   - UITableViewController
				   - UIToolbar
				   - UIColor
				   - UIDevice
				   - UIFont
				   - UIImage
				   - UIImageView
				   - UILabel
				   - UIScrollView
				   - UITableView
				   - UITextField
				   - UIView
				   - UIWebView
				   - UIWindow

                   ###XPKit:
                   - BFApp
                   - BFLog
                   - BFPassword
                   - BFSystemSound

                   DESC

  s.homepage     = "https://coding.net/u/huangxinping/p/XPKit-swift"
  s.screenshots  = "http://github.fabriziobrancati.com/XPKit-swift/resources/screenshot.png"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Huang Xinping" => "o0402@outlook.com" }
  s.social_media_url   = "https://weibo.com/o0402-monor"

  s.platform     = :ios, "8.0"

  s.source       = {
  	:git => "https://git.coding.net/huangxinping/XPKit-swift.git",
  	:tag => s.version.to_s,
  	:branch => 'master'
  }

  s.source_files  =  "Source/*.{h,swift}"
  s.public_header_files = "XPKit.swift"

  s.resources = "Source/Languages/**"

  s.frameworks  = "AudioToolbox"
  s.requires_arc = true

  s.subspec 'XPKit' do |ss|
  	ss.source_files = 'Source/XPKit/*.{h,swift}'
  	ss.public_header_files =''
  end

  s.subspec 'Extensions' do |ss|
  	ss.source_files = 'Source/Extensions/Foundation/*.{h,swift}'
  	ss.public_header_files =''
  end

  s.subspec 'UIKit' do |ss|
  	ss.source_files = 'Source/Extensions/UIKit/*.{h,swift}'
  	ss.public_header_files =''
  end

end

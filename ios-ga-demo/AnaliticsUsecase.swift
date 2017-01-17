//
//  AnaliticsUsecase.swift
//  ios-ga-demo
//
//  Created by Eiji Kushida on 2017/01/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit
import Google

protocol AnaliticsSetup {
    func setupAnalitics()
}

protocol AnaliticsUsecase {
    func sendScreenName(screenName: String)
    func sendEvent(category: String, action: String, label: String, value: NSNumber)
}

extension AnaliticsSetup where Self: AppDelegate {
    
    func setupAnalitics() {
        var configureError:NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
    }
}

extension AnaliticsUsecase where Self: UIViewController{
    
    func sendScreenName(screenName: String) {
        
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.set(kGAIScreenName, value: screenName)
        
        let builder = GAIDictionaryBuilder.createScreenView()
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    func sendEvent(category: String, action: String, label: String, value: NSNumber) {
        
        let tracker = GAI.sharedInstance().defaultTracker
        
        tracker.send(
            GAIDictionaryBuilder.createEventWithCategory(category,
                action: action, label: label, value: value).build() as [NSObject: AnyObject]
        )
    }
}

extension AppDelegate: AnaliticsSetup {}
extension UIViewController: AnaliticsUsecase {}

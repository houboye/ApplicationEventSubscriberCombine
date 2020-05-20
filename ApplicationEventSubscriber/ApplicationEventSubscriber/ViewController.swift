//
//  ViewController.swift
//  ApplicationEventSubscriber
//
//  Created by boye on 2020/5/20.
//  Copyright © 2020 boye. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController, ApplicationEventSubscriber {
    var cancellables: [Cancellable] = [Cancellable]()
    
    func respondToApplicationDidEnterBackground() {
        print("DidEnterBackground")
    }
    
    func respondToApplicationWillEnterForeground() {
        print("WillEnterForeground")
    }
    
    func respondToApplicationDidFinishLaunching() {
        print("DidFinishLaunching")
    }
    
    func respondToApplicationDidBecomeActive() {
        print("DidBecomeActive")
    }
    
    func respondToApplicationWillResignActive() {
        print("WillResignActive")
    }
    
    func respondToApplicationDidReceiveMemoryWarning() {
        print("DidReceiveMemoryWarning")
    }
    
    func respondToApplicationWillTerminate() {
        print("WillTerminate")
    }
    
    func respondToApplicationSignificantTimeChange() {
        print("SignificantTimeChange")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        beginObservingApplicationEvent()
    }

    deinit {
        cancelApplicationEventSubscribers()
    }
}


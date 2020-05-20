//
//  ApplicationEventSubscriber.swift
//  ApplicationEventSubscriber
//
//  Created by boye on 2020/5/20.
//  Copyright © 2020 boye. All rights reserved.
//

import UIKit
import Combine

protocol ApplicationEventSubscriber: class {
    var didEnterBackgroundPublisher: NotificationCenter.Publisher { get }
    
    var willEnterForegroundPublisher: NotificationCenter.Publisher { get }
    
    var didFinishLaunchingPublisher: NotificationCenter.Publisher { get }
    
    var didBecomeActivePublisher: NotificationCenter.Publisher { get }
    
    var willResignActivePublisher: NotificationCenter.Publisher { get }
    
    var didReceiveMemoryWarningPublisher: NotificationCenter.Publisher { get }
    
    var willTerminatePublisher: NotificationCenter.Publisher { get }
    
    var significantTimeChangePublisher: NotificationCenter.Publisher { get }
    
    var cancellables: [Cancellable] { get set }
    
    func beginObservingApplicationEvent()
    func cancelApplicationEventSubscribers()
    
    func onApplicationDidEnterBackgroundNotificationReceived(_ notification: Notification)
    func onApplicationWillEnterForegroundNotificationReceived(_ notification: Notification)
    func onApplicationDidFinishLaunchingNotificationReceived(_ notification: Notification)
    func onApplicationDidBecomeActiveNotificationReceived(_ notification: Notification)
    func onApplicationWillResignActiveNotificationReceived(_ notification: Notification)
    func onApplicationDidReceiveMemoryWarningNotificationReceived(_ notification: Notification)
    func onApplicationWillTerminateNotificationReceived(_ notification: Notification)
    func onApplicationSignificantTimeChangeNotificationReceived(_ notification: Notification)
    
    func respondToApplicationDidEnterBackground()
    func respondToApplicationWillEnterForeground()
    func respondToApplicationDidFinishLaunching()
    func respondToApplicationDidBecomeActive()
    func respondToApplicationWillResignActive()
    func respondToApplicationDidReceiveMemoryWarning()
    func respondToApplicationWillTerminate()
    func respondToApplicationSignificantTimeChange()
}

extension ApplicationEventSubscriber {
    var didEnterBackgroundPublisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)
    }
    
    var willEnterForegroundPublisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)
    }
    
    var didFinishLaunchingPublisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification)
    }
    
    var didBecomeActivePublisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification)
    }
    
    var willResignActivePublisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
    }
    
    var didReceiveMemoryWarningPublisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIApplication.didReceiveMemoryWarningNotification)
    }
    
    var willTerminatePublisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIApplication.willTerminateNotification)
    }
    
    var significantTimeChangePublisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIApplication.significantTimeChangeNotification)
    }
    
    func beginObservingApplicationEvent() {
        let didEnterBackgroundCancellable = didEnterBackgroundPublisher.sink { [weak self] (notification) in
            self?.onApplicationDidEnterBackgroundNotificationReceived(notification)
        }
        cancellables.append(didEnterBackgroundCancellable)
        
        let willEnterForegroundCancellable = willEnterForegroundPublisher.sink { [weak self] (notification) in
            self?.onApplicationWillEnterForegroundNotificationReceived(notification)
        }
        cancellables.append(willEnterForegroundCancellable)
        
        let didFinishLaunchingCancellable = didFinishLaunchingPublisher.sink { [weak self] (notification) in
            self?.onApplicationDidFinishLaunchingNotificationReceived(notification)
        }
        cancellables.append(didFinishLaunchingCancellable)
        
        let didBecomeActiveCancellable = didBecomeActivePublisher.sink { [weak self] (notification) in
            self?.onApplicationDidBecomeActiveNotificationReceived(notification)
        }
        cancellables.append(didBecomeActiveCancellable)
        
        let willResignActiveCancellable = willResignActivePublisher.sink { [weak self] (notification) in
            self?.onApplicationWillResignActiveNotificationReceived(notification)
        }
        cancellables.append(willResignActiveCancellable)
        
        let didReceiveMemoryWarningCancellable = didReceiveMemoryWarningPublisher.sink { [weak self] (notification) in
            self?.onApplicationDidReceiveMemoryWarningNotificationReceived(notification)
        }
        cancellables.append(didReceiveMemoryWarningCancellable)
        
        let willTerminateCancellable = willTerminatePublisher.sink { [weak self] (notification) in
            self?.onApplicationWillTerminateNotificationReceived(notification)
        }
        cancellables.append(willTerminateCancellable)
        
        let significantTimeChangeCancellable = significantTimeChangePublisher.sink { [weak self] (notification) in
            self?.onApplicationSignificantTimeChangeNotificationReceived(notification)
        }
        cancellables.append(significantTimeChangeCancellable)
    }
    
    func cancelApplicationEventSubscribers() {
        for c in cancellables {
            c.cancel()
        }
        cancellables.removeAll()
    }
    
    func onApplicationDidEnterBackgroundNotificationReceived(_ notification: Notification) {
        respondToApplicationDidEnterBackground()
    }
    func onApplicationWillEnterForegroundNotificationReceived(_ notification: Notification) {
        respondToApplicationWillEnterForeground()
    }
    func onApplicationDidFinishLaunchingNotificationReceived(_ notification: Notification) {
        respondToApplicationDidFinishLaunching()
    }
    func onApplicationDidBecomeActiveNotificationReceived(_ notification: Notification) {
        respondToApplicationDidBecomeActive()
    }
    func onApplicationWillResignActiveNotificationReceived(_ notification: Notification) {
        respondToApplicationWillResignActive()
    }
    func onApplicationDidReceiveMemoryWarningNotificationReceived(_ notification: Notification) {
        respondToApplicationDidReceiveMemoryWarning()
    }
    func onApplicationWillTerminateNotificationReceived(_ notification: Notification) {
        respondToApplicationWillTerminate()
    }
    func onApplicationSignificantTimeChangeNotificationReceived(_ notification: Notification) {
        respondToApplicationSignificantTimeChange()
    }
}

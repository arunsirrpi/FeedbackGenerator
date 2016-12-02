//
//  ViewController.swift
//  HapticDemo
//
//  Created by Arun Sirrpi on 2/12/16.
//  Copyright © 2016 Apptech Solutions. All rights reserved.
//

import UIKit

class NotificationHapticVC: UIViewController {
    
    /// impact
    fileprivate let lightImpact: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    fileprivate let medImpact: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    fileprivate let heavyImpact: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    /// selection
    fileprivate let selection: UISelectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    /// Notification
    fileprivate let notification: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()
    fileprivate var notificationType: UINotificationFeedbackType = .error
    
    // UIControls
    @IBOutlet var notificationSegment: UISegmentedControl!
    @IBOutlet var impactSegment: UISegmentedControl!
}

extension NotificationHapticVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        notificationSegment.selectedSegmentIndex = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NotificationHapticVC {
    
    @IBAction func selectionDidChange() {
        
        switch notificationSegment.selectedSegmentIndex {
        case 0:
            notificationType = .error
        case 1:
            notificationType = .success
        case 2:
            notificationType = .warning
        default:
            notificationType = .error
        }
        
        selection.selectionChanged()
    }
    
    @IBAction func playNotification() {
        notification.notificationOccurred(notificationType)
    }
    
    @IBAction func imactSelectionDidChange() {
        switch impactSegment.selectedSegmentIndex {
        case 0:
            lightImpact.impactOccurred()
        case 1:
            medImpact.impactOccurred()
        case 2:
            heavyImpact.impactOccurred()
        default:
            return
        }
    }
}

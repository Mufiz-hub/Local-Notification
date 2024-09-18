//
//  ViewController.swift
//  Local Notification Practice
//
//  Created by Rahul Sharma on 17/09/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    @IBOutlet weak var btnMain: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert,.badge,.sound]) { success , error  in
            
        }
        
    }


    @IBAction func btnMainAct(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "My Content Identifire"
        let identifire = "Main Indentifire"
        content.title = "Shah Rukh Khan Coming!"
        content.body = "Hey! Here is a exciting news for you shah rukh khan is coming today outide mannat to meets their fans."
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        content.userInfo = ["name" : "We are Coming Thankyou For Notification"]
        
        let url = Bundle.main.url(forResource: "notificationComing", withExtension: "jpeg")
        
        let attachment = try! UNNotificationAttachment(identifier: "image", url: url!)
        
        content.attachments = [attachment]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let requestt = UNNotificationRequest(identifier: identifire, content: content, trigger: trigger)
        notificationCenter.add(requestt) {
            (error) in
            print(error?.localizedDescription)
        }
        
        
        let like = UNNotificationAction.init(identifier: "Like", title: "Like",options: .foreground)
        
        let delete = UNNotificationAction.init(identifier: "Delete", title: "Delete", options: .destructive)
        let category = UNNotificationCategory.init(identifier: content.categoryIdentifier, actions: [like,delete], intentIdentifiers: [], options: [])
        notificationCenter.setNotificationCategories([category])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        
        if let dict = response.notification.request.content.userInfo as? [AnyHashable : Any]
        {
            vc.strTxt = dict["name"] as! String 
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


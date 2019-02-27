//
//  TodayViewController.swift
//  extension
//
//  Created by Alexey on 26.02.2019.
//  Copyright © 2019 AO. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding  {
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label.text =
        // Do any additional setup after loading the view from its nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let name = UserDefaults.init(suiteName: "group.com.scheduleproject")?.value(forKey: "name"){
            label.text = ((name as? String)!)
        }
    }
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        if let name = UserDefaults.init(suiteName: "group.com.scheduleproject")?.value(forKey: "name"){
            label.text = ((name as? String)!)
        }
        completionHandler(NCUpdateResult.newData)
    }
    
}

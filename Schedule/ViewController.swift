//
//  ViewController.swift
//  Schedule
//
//  Created by Alexey on 18.02.2019.
//  Copyright © 2019 AO. All rights reserved.
//

import UIKit
var data: [String] = ["Матан","Алгебра","Дисктретка"]
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentificator", for: indexPath)
        cell.textLabel?.text = data[indexPath.row];
        return cell;
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


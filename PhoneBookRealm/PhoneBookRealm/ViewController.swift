//
//  ViewController.swift
//  PhoneBookRealm
//
//  Created by Sekai Lab BD on 3/21/16.
//  Copyright © 2016 Sekai Lab BD. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dataSource: Results<ContactItem>!
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupUI()
        self.reloadTheTable()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        reloadTheTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadTheTable() {
        do {
            let realm = try Realm()
            dataSource = realm.objects(ContactItem)
            tableview.reloadData()
        } catch {
            
        }
    }
    
    func setupUI() {
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifer: String = "myCell"
        var cell = tableview.dequeueReusableCellWithIdentifier(identifer)
        
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: identifer)
        }
        let contactinfo = dataSource[indexPath.row]
        cell?.textLabel?.text = contactinfo.Name
        cell?.detailTextLabel?.text = contactinfo.PhoneNumber
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print("Selected row at \(indexPath.row)")
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 50
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? // custom view for header. will be adjusted to default or specified header height
    {
        let myHeader = UIView(frame: CGRectMake(0, 0, tableView.frame.width, 80))
        myHeader.backgroundColor = UIColor.yellowColor()
        return myHeader
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 80
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? // custom view for footer. will be adjusted to default or specified footer height
    {
        let myHeader = UIView(frame: CGRectMake(0, 0, tableView.frame.width, 80))
        myHeader.backgroundColor = UIColor.purpleColor()
        return myHeader
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 80
    }
    
    
    
    @IBAction func actionGoToEnteryVC(sender: AnyObject) {
        performSegueWithIdentifier("goToEnteryVC", sender: nil)
    }

    
    


}


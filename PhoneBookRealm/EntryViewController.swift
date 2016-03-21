//
//  EntryViewController.swift
//  PhoneBookRealm
//
//  Created by Sekai Lab BD on 3/21/16.
//  Copyright © 2016 Sekai Lab BD. All rights reserved.
//

import UIKit
import RealmSwift

class EntryViewController: UIViewController {
    @IBOutlet weak var txtNameField: UITextField!
    @IBOutlet weak var txtNumberField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func actionSaveData(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        self.saveData()
    }
    
    func saveData() {
        let newContact = ContactItem()
        newContact.Name = self.txtNameField!.text!
        newContact.PhoneNumber = self.txtNumberField!.text!
        
        do {
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newContact)
                print("saved......")
            })
            
        } catch {
            
        }
      
    }
    
    

}

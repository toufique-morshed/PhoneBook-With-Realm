//
//  ContactItem.swift
//  PhoneBookRealm
//
//  Created by Sekai Lab BD on 3/21/16.
//  Copyright © 2016 Sekai Lab BD. All rights reserved.
//

import UIKit

import RealmSwift

class ContactItem: Object {
    dynamic var Name : String = ""
    dynamic var PhoneNumber : String = ""
}

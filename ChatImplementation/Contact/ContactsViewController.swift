//
//  ViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 1/26/21.
//

import UIKit
import FanapPodChatSDK

class ContactsViewController: UIViewController {

	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func btnGetContactsTaped(_ sender: UIButton) {
		Chat.sharedInstance.getContacts(inputModel: .init(count: 10, offset: 0 , query: "up")) { (result) in
			print(result)
		}
	}
	
	@IBAction func btnOldGetContactsTaped(_ sender: UIButton) {
		let contactModel = GetContactsRequest(count: 10, offset: 0, query: nil, typeCode: nil, uniqueId: "myUniqueId" )
		Chat.sharedInstance.getContacts(inputModel: contactModel, getCacheResponse: false) { (uniqueId) in
			print(uniqueId)
		} completion: { (result) in
			print(result)
		} cacheResponse: { (casheContactModel) in
			print(casheContactModel)
		}
	}
    
    
    @IBAction func btnAddNewContactsTaped(_ sender: UIButton) {
        Chat.sharedInstance.addContact(inputModel: .init(cellphoneNumber: "09123662921", email: "testsss@gmail.com", firstName: "mit new 3", lastName: "hosseini")){ (result) in
            print(result)
        }
    }
    
    @IBAction func btnOldAddContactTaped(_ sender: UIButton) {
        let contactModel = AddContactRequest(cellphoneNumber: "09125956063", email: "testnewhamed@gmail.com", firstName: "mina from old method", lastName: "hosseini", typeCode: nil ,uniqueId: nil)
        Chat.sharedInstance.addContact(inputModel: contactModel) { (uniqueId) in
            print(uniqueId)
        } completion: { (result) in
            print(result)
        }
    }
	
}


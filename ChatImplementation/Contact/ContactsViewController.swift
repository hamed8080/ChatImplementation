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
		let nthContact = 7
		Chat.sharedInstance.addContact(.init(cellphoneNumber: "",
											 email: "testhamed\(nthContact)@gmail.com",
											 firstName: "testnew\(nthContact)",
											 lastName: "tessfamily\(nthContact)")){ (result) in
			print(result)
		}
	}
	
	@IBAction func btnOldAddContactTaped(_ sender: UIButton) {
		let nthContact = 7
		let contactModel = AddContactRequest(cellphoneNumber: "09125956063",
											 email: "test\(nthContact)@gmail.com",
											 firstName: "firstName\(nthContact) oldmethod",
											 lastName: "family\(nthContact)",
											 typeCode: nil ,uniqueId: nil)
		Chat.sharedInstance.addContact(inputModel: contactModel) { (uniqueId) in
			print(uniqueId)
		} completion: { (result) in
			print(result)
		}
	}
	
	
	@IBAction func btnAddBatchContactsTaped(_ sender: UIButton) {
		let nthContact1 = 10
		let nthContact2 = 11
		let contact1 = AddContactRequest(cellphoneNumber: "0912595606\(nthContact1)",
										 email: "test\(nthContact1)@gmail.com",
										 firstName: "firstName\(nthContact1) oldmethod",
										 lastName: "family\(nthContact1)",
										 typeCode: nil ,uniqueId: nil)
		let contact2 = AddContactRequest(cellphoneNumber: "0912595606\(nthContact2)",
										 email: "test\(nthContact2)@gmail.com",
										 firstName: "firstName\(nthContact2) oldmethod",
										 lastName: "family\(nthContact2)",
										 typeCode: nil ,uniqueId: nil)
		
		Chat.sharedInstance.addContacts([contact1 , contact2] ,
										completion: { result in
											print(result)
										})
	}
	
	@IBAction func btnAddBatchContactsOldTaped(_ sender: UIButton) {
		let nthContact1 = 12
		let nthContact2 = 13
		
		let contacts = AddContactsRequest(cellphoneNumbers: ["093691616\(nthContact1)", "093691616\(nthContact2)"],
										  emails: ["test\(nthContact1)@gmail.com", "test\(nthContact2)@gmail.com"],
										  firstNames: ["firstName-Old\(nthContact1)","firstName-Old\(nthContact2)"],
										  lastNames: ["lastNames\(nthContact1)","lastNames\(nthContact2)"],
										  userNames: ["",""],
										  typeCode: "default",
										  uniqueIds: ["fakeUniqueId\(nthContact1)","fakeUniqueId\(nthContact2)"])
		Chat.sharedInstance.addContacts(inputModel: contacts) { (uniqueId) in
			print(uniqueId)
		} completion: { result in
			print(result)
		}
		
	}
	
	
	@IBAction func btnNoSeenContactTaped(_ sender: UIButton){
		Chat.sharedInstance.contactNotSeenDuration(.init(userIds: [3661443], typeCode: "default") ,
												   uniqueId: "fakeUniqueId",
												   completion: { (result) in
													print(result)
												   })
	}
	
	@IBAction func btnNoSeenContactOldTaped(_ sender: UIButton){
		
	}
}


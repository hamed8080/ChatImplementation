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
		Chat.sharedInstance.getContacts(.init(count: 10, offset: 0), useCache: true) { response , cache , error in
            if let cachedContacts = cache{
                print(cachedContacts)
            }
            if let contacts = response{
                print(contacts)
            }
            if let error = error{
                print(error)
            }
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
		let nthContact = 13
        let req = AddContactRequest(cellphoneNumber: "",
                        email: "testhamed\(nthContact)@gmail.com",
                        firstName: "testnew\(nthContact)",
                        lastName: "tessfamily\(nthContact)")
        Chat.sharedInstance.addContact(req , useCache: true) { response in
            print(response)
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
		let nthContact1 = 12
		let nthContact2 = 13
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
		
        
        Chat.sharedInstance.addContacts([contact1  ,contact2] , useCache: true) { response in
            print(response)
        }
	}
	
	@IBAction func btnAddBatchContactsOldTaped(_ sender: UIButton) {
		let nthContact1 = 12
		let nthContact2 = 13
		
		let contacts = AddContactsRequest(cellphoneNumbers: ["093691616\(nthContact1)", "093691616\(nthContact2)"],
						   emails: ["test\(nthContact1)@gmail.com", "test\(nthContact2)@gmail.com"],
						   firstNames: ["firstName-Old\(nthContact1)","firstName-Old\(nthContact2)"],
						   lastNames: ["lastNames\(nthContact1)","lastNames\(nthContact2)"],
						   typeCode:  "default",
						   uniqueIds: ["fakeUniqueId\(nthContact1)","fakeUniqueId\(nthContact2)"])
		Chat.sharedInstance.addContacts(inputModel: contacts) { (uniqueId) in
			print(uniqueId)
		} completion: { result in
			print(result)
		}
		
	}
	
	
	@IBAction func btnNoSeenContactTaped(_ sender: UIButton){
        Chat.sharedInstance.contactNotSeen(.init(userIds: [3661443])) { response in
            print(response)
        }
    }
	
	@IBAction func btnNoSeenContactOldTaped(_ sender: UIButton){
        Chat.sharedInstance.contactNotSeenDuration(inputModel: .init(userIds: [3661443], typeCode: "defualt", uniqueId: "fakeUniqueId")) { (uniqueIdResult) in
            print(uniqueIdResult)
        } completion: { (result) in
            print(result)
        }
	}
    
    @IBAction func btnRemoveContactTaped(_ sender: UIButton){
		Chat.sharedInstance.removeContact(.init(contactId: 25391200, typeCode: "defualt")) { response in
			if let removeContactResponse = response.result as? RemoveContactResponse{
				print(removeContactResponse)
			}
		}
    }
    
    @IBAction func btnRemoveContactOldTaped(_ sender: UIButton){
        Chat.sharedInstance.removeContact(inputModel: .init(contactId: 22713559, typeCode: nil, uniqueId: "fakeUniqueId")) { (uniqueId) in
            print(uniqueId)
        } completion: { (result) in
            print(result)
        }
    }
    
    @IBAction func btnSearchContactTaped(_ sender: UIButton){
		Chat.sharedInstance.searchContacts(.init(query: "ha")) { response , cache , error in
			if let cachedContacts = cache{
				print(cachedContacts)
			}
			if let contacts = response{
				print(contacts)
			}
			if let error = error{
				print(error)
			}
		}
    }
    
    @IBAction func btnSearchContactOldTaped(_ sender: UIButton){
        let searchContactsRequest = SearchContactsRequest(cellphoneNumber: nil,
                                                          contactId: nil,
                                                          count: nil,
                                                          email: nil,
                                                          offset: nil,
                                                          order: nil,
                                                          query: "up",
                                                          summery: nil,
                                                          typeCode: nil,
                                                          uniqueId: nil)
        Chat.sharedInstance.searchContacts(inputModel: searchContactsRequest,getCacheResponse: true) { (uniqueId) in
            print(uniqueId)
        } completion: { (result) in
            print(result)
        } cacheResponse: { (cashe) in
            print(cashe)
        }
    }
    
    @IBAction func btnSyncContactsTaped(_ sender: UIButton){
		Chat.sharedInstance.syncContacts() { response in
			if let contacts = response.result as?  [Contact]{
				print(contacts)
			}
		}
    }
    
    @IBAction func btnSyncContactsOldTaped(_ sender: UIButton){
        Chat.sharedInstance.syncContacts { uniqueIds in
            print(uniqueIds)
        } completion: { result in
            print(result)
        }
    }
    
    @IBAction func btnUpdateContactTaped(_ sender: UIButton){
        let req = UpdateContactRequest(cellphoneNumber: "09148401824",
                                                email: "amjadi@gmail.com",
                                                firstName: "masoud update",
                                                id: 24420613,
                                                lastName: "amjadi",
                                                username: "ma.amjadi")
		Chat.sharedInstance.updateContact(req) { response in
			if let contactResponse = response.result as? ContactResponse {
				print(contactResponse.contacts)
			}
		}
    }
    
    @IBAction func btnUpdateContactOldTaped(_ sender: UIButton){
        
        let req = UpdateContactsRequest(cellphoneNumber: "09148401824",
                                                email: "amjadi@gmail.com",
                                                firstName: "masoud",
                                                id: 24420613,
                                                lastName: "amjadi",
                                                username: "ma.amjadi",
												typeCode: nil,
												uniqueId: nil
												)
        Chat.sharedInstance.updateContact(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { result in
            print(result)
        }

    }
	
	@IBAction func btnBlockContactTaped(_ sender: UIButton){
		Chat.sharedInstance.blockContact(.init(contactId: 23043316)) { uniqueIdresult in
			
		} completion: { contactResponse in
			
		}
	}
	
	@IBAction func btnBlockContactOldTaped(_ sender: UIButton){
		let req = BlockRequest(contactId: 22712926, threadId: nil, userId: nil, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.blockContact(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { result in
			print(result)
		}
	}
	
	@IBAction func btnUnBlockContactTaped(_ sender: UIButton){
		Chat.sharedInstance.unBlockContact(.init(contactId: 23043316)) { response in
			if let unblocked = response.result as? BlockedUser{
				print(unblocked)
			}
		}
	}
	
	@IBAction func btnUnBlockContactOldTaped(_ sender: UIButton){
		Chat.sharedInstance.unblockContact(inputModel: .init(contactId: 23043316)) { result in
			print(result)
		} completion: { result in
			print(result)
		}
	}
	
	@IBAction func btnBlockedContactsTaped(_ sender: UIButton){

        Chat.sharedInstance.getBlockedContacts(.init(count: 50, offset: 0)) { response in
            if response.error == nil , let bloackedContacts = response.result as? [BlockedUser]{
                print(bloackedContacts)
            }
        }
	}
	
	@IBAction func btnBlockedContactsOldTaped(_ sender: UIButton){
		Chat.sharedInstance.getBlockedContacts(inputModel: .init(count: 50, offset: 0 , typeCode: "default" , uniqueId: "fakeBlockedListUniqueId"), getCacheResponse: false) { uniuqeId in
			print(uniuqeId)
		} completion: { result in
			print(result)
		}
	}
}


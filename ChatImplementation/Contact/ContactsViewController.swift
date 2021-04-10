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
        
        Chat.sharedInstance.getContacts(.init(count: 10, offset: 0 )) { response, uniqueId ,pagination, error in
			print(response ?? "")
        } cacheResponse:  { response, uniqueId , pagination, error in
            print(response ?? "")
        } uniqueIdResult:{uniqueId in
            print(uniqueId)
        }
        
        // OR use withouth cacheResponse Compelition Handler and uniqueIdResult Compelition Handler
//        Chat.sharedInstance.getContacts(.init(count: 10, offset: 0)) { response, error in
//            print (response ?? "")
//        }
    }
	
	@IBAction func btnOldGetContactsTaped(_ sender: UIButton) {
		let contactModel = GetContactsRequest(count: 10, offset: 0, query: nil, typeCode: nil, uniqueId: "myUniqueId" )
		Chat.sharedInstance.getContacts(inputModel: contactModel, getCacheResponse: true) { uniqueId in
			print(uniqueId)
		} completion: { result in
			print(result)
		} cacheResponse: { cacheContactModel in
			print(cacheContactModel)
		}
	}
	
	
	@IBAction func btnAddNewContactsTaped(_ sender: UIButton) {
		let nthContact = 20
        let req = NewAddContactRequest(cellphoneNumber: "",
                        email: "testhamed\(nthContact)@gmail.com",
                        firstName: "testnew\(nthContact)",
                        lastName: "tessfamily\(nthContact)"
        )
        Chat.sharedInstance.addContact(req) { response, uniqueId , error in
            print(response ?? "")
        }
	}
	
	@IBAction func btnOldAddContactTaped(_ sender: UIButton) {
		let nthContact = 7
		let contactModel = AddContactRequest(cellphoneNumber: "09125956063",
											 email: "test\(nthContact)@gmail.com",
											 firstName: "firstName\(nthContact) oldmethod",
                                             lastName: "family\(nthContact)",
                                             ownerId: nil,
											 typeCode: nil ,
                                             uniqueId: nil)
		Chat.sharedInstance.addContact(inputModel: contactModel) { (uniqueId) in
			print(uniqueId)
		} completion: { (result) in
			print(result)
		}
	}
	
	@IBAction func btnAddBatchContactsTaped(_ sender: UIButton) {
		let nthContact1 = 34
		let nthContact2 = 35
		let contact1 = NewAddContactRequest(cellphoneNumber: "091259560\(nthContact1)",
										 email: "test\(nthContact1)gmail.com",
										 firstName: "firstName\(nthContact1) oldmethod",
										 lastName: "family\(nthContact1)")
		let contact2 = NewAddContactRequest(cellphoneNumber: "091259560\(nthContact2)",
										 email: "test\(nthContact2)@gmail.com",
										 firstName: "firstName\(nthContact2) oldmethod",
										 lastName: "family\(nthContact2)")


        Chat.sharedInstance.addContacts([contact1  ,contact2]) { response , uniqueId ,error  in
            print(response ?? "")
        }uniqueIdsResult: { uniqueIds in
            print(uniqueIds)
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
		Chat.sharedInstance.addContacts(inputModel: contacts) { (uniqueIds) in
			print(uniqueIds)
		} completion: { result in
			print(result)
		}
		
	}
	
	
	@IBAction func btnNoSeenContactTaped(_ sender: UIButton){
        Chat.sharedInstance.contactNotSeen(.init(userIds: [3661443])) { response, uniqueId , error in
            print(response ?? "" )
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
		Chat.sharedInstance.removeContact(.init(contactId: 25391188)) { deleted, uniqueId , error in
			if deleted == true{
				print("deleted")
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
        Chat.sharedInstance.searchContacts(.init(query: "ha")) { response, uniqueId ,pagination, error in
            if let contacts = response {
                print(contacts)
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
        Chat.sharedInstance.syncContacts() { response , uniqueId , error  in
			if let contacts = response{
				print(contacts)
			}
        }uniqueIdsResult: { uniqueIds in
            print(uniqueIds)
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
		Chat.sharedInstance.updateContact(req) { response, uniqueId , error in
			if let contacts = response {
				print(contacts)
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
		Chat.sharedInstance.blockContact(.init(contactId: 23043316)) { response, uniqueId , error in
            print(response ?? "")
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
		Chat.sharedInstance.unBlockContact(.init(contactId: 23043316)) { response, uniqueId , error in
            print(response ?? "")
		}
	}
	
	@IBAction func btnUnBlockContactOldTaped(_ sender: UIButton){
        let req = UnblockRequest(blockId: nil, contactId: 23043316, threadId: nil, userId: nil, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.unblockContact(inputModel: req ) { result in
			print(result)
		} completion: { result in
			print(result)
		}
	}
	
	@IBAction func btnBlockedContactsTaped(_ sender: UIButton){

        Chat.sharedInstance.getBlockedContacts(.init(count: 50, offset: 0)) { response, uniqueId , pagination ,error in
            if let blockedUser  = response{
                print(blockedUser)
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


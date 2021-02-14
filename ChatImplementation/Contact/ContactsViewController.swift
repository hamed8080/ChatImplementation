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
		Chat.sharedInstance.getContacts(.init(count: 10, offset: 0 , query: "up") , getCacheResponse: true , completion: { result in
			print(result)
        },cacheResponse : { result in
            print(result)
        })
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
		Chat.sharedInstance.contactNotSeenDuration(.init(userIds: [3661443]) ,
                                                   uniqueId: "fakeUniqueId",
                                                   typeCode: "default",
                                                   uniqueIdResult: { uniqueIdResult in
                                                    print(uniqueIdResult)
                                                   },
                                                   completion: { result in
                                                    print(result)
                                                   })
    }
	
	@IBAction func btnNoSeenContactOldTaped(_ sender: UIButton){
        Chat.sharedInstance.contactNotSeenDuration(inputModel: .init(userIds: [3661443], typeCode: "defualt", uniqueId: "fakeUniqueId")) { (uniqueIdResult) in
            print(uniqueIdResult)
        } completion: { (result) in
            print(result)
        }
	}
    
    @IBAction func btnRemoveContactTaped(_ sender: UIButton){
        Chat.sharedInstance.removeContact(.init(contactId: 22713559, typeCode: "defualt") , completion: { (result) in
           print(result)
        })

    }
    
    @IBAction func btnRemoveContactOldTaped(_ sender: UIButton){
        Chat.sharedInstance.removeContact(inputModel: .init(contactId: 22713559, typeCode: nil, uniqueId: "fakeUniqueId")) { (uniqueId) in
            print(uniqueId)
        } completion: { (result) in
            print(result)
        }
    }
    
    @IBAction func btnSearchContactTaped(_ sender: UIButton){
        let searchContactsRequest = SearchContactsRequest(query: "up")
        Chat.sharedInstance.searchContacts( searchContactsRequest , getCacheResponse: true, completion: { result in
            print(result)
        }, cacheResponse: { result in
            print(result)
        })
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
        Chat.sharedInstance.syncContacts { result in
            print(result)
        } uniqueIdsResult: { uniqueIds in
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
        let req = UpdateContactRequest(cellphoneNumber: "989386358048",
                                                email: "updated email",
                                                firstName: "updated name",
                                                id: 22713559,
                                                lastName: "updated lastname",
                                                username: "updated userName")
        Chat.sharedInstance.updateContact(req) { (result) in
            print(result)
        }

    }
    
    @IBAction func btnUpdateContactOldTaped(_ sender: UIButton){
        
//        let req = UpdateContactRequest(cellphoneNumber: "09369161601",
//                                                email: "updated email",
//                                                firstName: "updated name",
//                                                id: 123,
//                                                lastName: "updated lastname",
//                                                username: "updated userName")
//        Chat.sharedInstance.updateContact(inputModel: req) { uniqueId in
//            print(uniqueId)
//        } completion: { result in
//            print(result)
//        }

    }
	
	@IBAction func btnBlockContactTaped(_ sender: UIButton){
		Chat.sharedInstance.blockContact(.init(contactId: 22712926)) { result in
			print(result)
		}
	}
	
	@IBAction func btnBlockContactOldTaped(_ sender: UIButton){
		Chat.sharedInstance.blockContact(inputModel: .init(contactId: 22712926)) { uniqueId in
			print(uniqueId)
		} completion: { result in
			print(result)
		}
	}
	
	@IBAction func btnUnBlockContactTaped(_ sender: UIButton){
		
	}
	
	@IBAction func btnUnBlockContactOldTaped(_ sender: UIButton){
		
	}
	
	@IBAction func btnBlockedContactsTaped(_ sender: UIButton){

        NewChat.shared.getBlockedContacts(.init(), uniqueId: "fakeBlockedListUniqueId"){ (result:BlockedContacts) in
            print(result)
        }
        
        //		Chat.sharedInstance.blockedContacts(.init(), completion: { result in
//			print(result)
//		})
	}
	
	@IBAction func btnBlockedContactsOldTaped(_ sender: UIButton){
		Chat.sharedInstance.getBlockedContacts(inputModel: .init(count: 50, offset: 0 , typeCode: "default" , uniqueId: "fakeBlockedListUniqueId"), getCacheResponse: false) { uniuqeId in
			print(uniuqeId)
		} completion: { result in
			print(result)
		}
	}
}


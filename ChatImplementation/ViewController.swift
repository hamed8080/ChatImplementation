//
//  ViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 1/26/21.
//

import UIKit
import FanapPodChatSDK

class ViewController: UIViewController , ChatDelegates{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Chat.sharedInstance.delegate = self
        // Do any additional setup after loading the view.
        // Chat.sharedInstance.delegate = self
       
        Chat.sharedInstance.createChatObject(object:.init(
                                                          //socketAddress: "wss://chat-sandbox.pod.ir/ws",
                                                          socketAddress: "wss://msg.pod.ir/ws",
                                                          serverName: "chat-server",
                                                          token: "e1af8fa5edff4739aa9432acf2439619"))
    }
    
    func chatConnect() {
        
    }
    
    func chatDisconnect() {
        
    }
    
    func chatReconnect() {
        
    }
    
    func chatReady(withUserInfo: User) {
        
		let contactModel = GetContactsRequest(count: 10, offset: 0)
//		let contactModel = GetContactsRequest(count: 10, offset: 0, query: nil, typeCode: nil, uniqueId: nil )
		Chat.sharedInstance.getContacts(inputModel: contactModel, getCacheResponse: false) { (uniqueId) in
			let i = 0
		} completion: { (result) in
			let i = 0
		} cacheResponse: { (cacheContactModel) in
			let i = 0
		}
        
//        Chat.sharedInstance.getThreads(inputModel: GetThreadsRequest(count: 10, creatorCoreUserId: nil, metadataCriteria: nil, name: nil, new: nil, offset: 0, partnerCoreContactId: nil, partnerCoreUserId: nil, threadIds: nil, typeCode: nil, uniqueId: nil), getCacheResponse: false) { (uniqueId) in
//
//        } completion: { (result) in
//            let i = 0
//        } cacheResponse: { (cashe) in
//            let i = 0
//        }


		
//		let inputModel = DeleteMessageRequestModel(deleteForAll: nil, subjectId: 87348, typeCode: nil, uniqueId: nil)
//		Chat.sharedInstance.deleteMessage(inputModel: inputModel, uniqueId: { (deleteMEssageUniqueId) in
//			print("Delete Message Unique ID = \(deleteMEssageUniqueId)")
//		}, completion: { (response) in
//			print("delete Message response: \n \(response)")
//		})
		
		
//		Chat.sharedInstance.getContacts(inputModel: GetContactsRequest(count: <#T##Int?#>, offset: <#T##Int?#>, query: <#T##String?#>, typeCode: <#T##String?#>, uniqueId: <#T##String?#>)) { (uniqueId) in
//
//		} completion: { (result) in
//
//		}
    }
    
    func chatState(state: AsyncStateType) {
        
    }
    
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {
        
    }
    
    func botEvents(model: BotEventModel) {
        
    }
    
    func contactEvents(model: ContactEventModel) {
        
    }
    
    func fileUploadEvents(model: FileUploadEventModel) {
        
    }
    
    func messageEvents(model: MessageEventModel) {
        
    }
    
    func systemEvents(model: SystemEventModel) {
        
    }
    
    func threadEvents(model: ThreadEventModel) {
        
    }
    
    func userEvents(model: UserEventModel) {
        
    }

}


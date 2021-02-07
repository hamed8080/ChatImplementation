//
//  ChatDelegateImplementation.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/6/21.
//

import Foundation
import FanapPodChatSDK

class ChatDelegateImplementation: ChatDelegates {
	
	private (set) static var sharedInstance = ChatDelegateImplementation()
	private init(){}
	
	
	func chatConnect() {
		
	}
	
	func chatDisconnect() {
		
	}
	
	func chatReconnect() {
		
	}
	
	func chatReady(withUserInfo: User) {
		
		
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
		if errorCode == 21 {
			txtTokenExpired.isHidden = false
		}
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

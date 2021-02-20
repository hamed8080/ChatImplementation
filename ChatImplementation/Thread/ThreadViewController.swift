//
//  ThreadViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/20/21.
//

import Foundation
import UIKit
import FanapPodChatSDK

class ThreadViewController : UIViewController{
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func btnGetThreadsTaped(_ button:UIButton) {
		Chat.sharedInstance.request(.Threads(req: .init() )) { response in
			if let conversations = response.result as? [Conversation]{
				print(conversations)
			}
		}
	}
	
	@IBAction func btnGetThreadsOldTaped(_ button:UIButton) {
		let req = GetThreadsRequest(count:                 9,    // count of threads to be received (default value is 50)
									creatorCoreUserId:     nil,  // SSO User Id of thread creator
									metadataCriteria:      nil,  //
									name:                  nil,  // Search term to look up in thread Titles
									new:                   nil,  //
									offset:                0,    // offset of select query (default value is 0)
									partnerCoreContactId:  nil,  // Contact Id of thread partner
									partnerCoreUserId:     nil,  // SSO User Id of thread partner
									threadIds:             nil,  // An array of thread ids to be received
									typeCode:              nil,
									uniqueId:              nil)
		Chat.sharedInstance.getThreads(inputModel: req,
									   getCacheResponse: false) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		} cacheResponse: { cache in
			print(cache)
		}
		
	}
	
	@IBAction func btnIsNameAvailableTaped(_ button:UIButton) {
		Chat.sharedInstance.request(.IsThreadNamePublic(req: .init(name:"testlsdflsadfhslfalsb") )) { response in
			if let availableName = response.result as? PublicThreadNameAvailableResponse{
				print(availableName)
			}
		}
	}
	
	@IBAction func btnIsNameAvailableOldTaped(_ button:UIButton) {
		let req = IsPublicThreadNameAvailableRequest(name: "wjdgjqwdgkjwqdqkd", typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.isNameAvailable(inputModel: req ) { uniqueId in
			print(uniqueId)
		} completion: { resposne in
			print(resposne)
		}
	}
	
	@IBAction func btnMuteThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.request(.MuteThread(req: .init(threadId:318964))) { response in
			if let availableName = response.result as? MuteThreadResponse{
				print(availableName)
			}
		}
	}
	
	@IBAction func btnMuteThreadOldTaped(_ button:UIButton) {
		let req = MuteUnmuteThreadRequest(subjectId: 318964, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.muteThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
}

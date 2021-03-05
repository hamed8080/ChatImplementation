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
        Chat.sharedInstance.getThreads(.init()) { response , error in
			if let conversations = response{
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
		Chat.sharedInstance.isThreadNamePublic(.init(name:"testlsdflsadfhslfalsb")) { threadName , error in
            print(threadName ?? "")
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
		Chat.sharedInstance.muteThread(.init(threadId:318964)) { threadId , error in
            print(threadId ?? "" )
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
	
	@IBAction func btnUnMuteThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.unmuteThread(.init(threadId:318964)) { threadId , error in
			print(threadId ?? "")
		}
	}
	
	
	@IBAction func btnUnMuteThreadOldTaped(_ button:UIButton) {
		let req = MuteUnmuteThreadRequest(subjectId: 318964, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.unmuteThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnPinThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.pinThread(.init(threadId:318964)) { threadId , error in
            print(threadId ?? "")
		}
	}
	
	@IBAction func btnPinThreadOldTaped(_ button:UIButton) {
		let req = PinUnpinThreadRequest(threadId: 318964, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.pinThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnUnPinThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.unpinThread(.init(threadId:318964)) { threadId , error in
            print(threadId ?? "")
		}
	}
	
	@IBAction func btnUnPinThreadOldTaped(_ button:UIButton) {
		let req = PinUnpinThreadRequest(threadId: 318964, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.unpinThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnCreateThreadTaped(_ button:UIButton) {
		let invites:[Invitee] = [
			Invitee(id: "\(24420613)", idType: .TO_BE_USER_CONTACT_ID)
//			Invitee(id: "s.khobbakht", idType: .TO_BE_USER_USERNAME),
		]
//		let req = CreateThreadRequest(description: "خودت رو به خودت ثابت کن نه به دیگران",
//									  image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
//									  invitees: invites,
//									  metadata: "",
//									  title: "test",
//									  type: .NORMAL,
//									  uniqueName: "TEST PUBLIC GROUP IOS APP",
//									  typeCode: nil,
//									  uniqueId: nil)
		let req = NewCreateThreadRequest(description: "خودت رو به خودت ثابت کن نه به دیگران",
									  image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
									  invitees: invites,
									  metadata: "",
									  title: "test",
									  type: .PUBLIC_GROUP,
									  uniqueName: "TEST_PUBLIC_GROUP_IOS_APP_HAMED")
		Chat.sharedInstance.createThread(req) { response , error in
            print(response ?? "")
		}
	}
	
	@IBAction func btnCreateThreadOldTaped(_ button:UIButton) {
		let invites:[Invitee] = [
			Invitee(id: "ma.amjadi", idType: .TO_BE_USER_USERNAME)
		]
		let req = CreateThreadRequest(description: "خودت رو به خودت ثابت کن نه به دیگران",
									  image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
									  invitees: invites,
									  metadata: "",
									  title: "test",
									  type: .NORMAL,
									  uniqueName: "TEST PUBLIC GROUP IOS APP")
		Chat.sharedInstance.createThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	
	@IBAction func btnAddParticipantToThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.addParticipant(.init(userName: "ma.amjadi", threadId:318964)) { response , error in
            print(response ?? "")
		}
	}
	
	@IBAction func btnAddParticipantToThreadOldTaped(_ button:UIButton) {
		let participants = AddParticipantsRequest(usernames: ["ma.amjadi"],
												  threadId: 318964 ,
												  typeCode: nil,
												  uniqueId: nil)
		Chat.sharedInstance.addParticipants(inputModel: participants) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}

	}
	
	@IBAction func btnRemoveParticipantToThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.removeParticipant(.init(participantId: 126255, threadId: 318964)) { response , error in
            print(response ?? "")
		}
	}
	
	@IBAction func btnRemoveParticipantToThreadOldTaped(_ button:UIButton) {
		let participants = RemoveParticipantsRequest(participantIds: [126255],
													 threadId: 318964,
													 typeCode: nil,
													 uniqueId: nil)
		Chat.sharedInstance.removeParticipants(inputModel: participants) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnJoinThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.joinThread(.init(threadName: "TEST_PUBLIC_GROUP_IOS_APP_HAMED")) { response , error in
			print(response ?? "")
		}
	}
	
	@IBAction func btnJoinThreadOldTaped(_ button:UIButton) {
		let req = JoinPublicThreadRequest(uniqueName: "TEST_PUBLIC_GROUP_IOS_APP", typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.joinThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnCloseThreadTaped(_ button:UIButton) {
        Chat.sharedInstance.closeThread(.init(threadId: 318964)) { threadId , error in
			print(threadId ?? "")
		}
	}
	
	@IBAction func btnCloseThreadOldTaped(_ button:UIButton) {
	
		let req = CloseThreadRequest(threadId: 318964 , typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.closeThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnUpdateThreadInfoTaped(_ button:UIButton) {
        let req = NewUpdateThreadInfoRequest(threadId: 318964, title: "")
		Chat.sharedInstance.updateThreadInfo(req) { progress in
			print(progress)
		} completion: { response , error in
			print(response ?? "")
		}
	}
	
	@IBAction func btnUpdateThreadInfoOldTaped(_ button:UIButton) {
    
	}
    
    @IBAction func btnCreateThreadWithMessageTaped(_ button:UIButton) {
        let invites:[Invitee] = [
            Invitee(id: "ma.amjadi", idType: .TO_BE_USER_USERNAME)
        ]
        let threadMessage = CreateThreadMessage(text: "Hello", messageType: .TEXT)
        let req = CreateThreadWithMessage(description: "خودت رو به خودت ثابت کن نه به دیگران",
                                          image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
                                          invitees: invites,
                                          metadata: "",
                                          title: "Thread with message",
                                          type: .NORMAL,
                                          uniqueName: "TEST_PUBLIC_GROUP_IOS_APP_THREAD_WITH_MESSAGE",
                                          message: threadMessage)
		
		Chat.sharedInstance.createThreadWithMessage(req) { uniqueId in
			print(uniqueId)
		} onSent: { onSentResult , error in
			print(onSentResult ?? "")
		} onDelivery: { onDeliveryResult , error in
			print(onDeliveryResult ?? "")
		} onSeen: { onSeenResult , error  in
            print(onSeenResult ?? "")
		} completion: { response , error in
			print(response ?? "")
		}
    }
    
    @IBAction func btnCreateThreadWithMessageOldTaped(_ button:UIButton) {
        let invites:[Invitee] = [
            Invitee(id: "ma.amjadi", idType: .TO_BE_USER_USERNAME)
        ]
        let threadMessage = CreateThreadMessageInput(forwardedMessageIds: nil, repliedTo: nil, text: "HELLO", messageType: .TEXT, systemMetadata: nil, uniqueId: nil)
        let createThreadReq = CreateThreadRequest(description: "خودت رو به خودت ثابت کن نه به دیگران",
                                          image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
                                          invitees: invites,
                                          metadata: "",
                                          title: "Thread with message",
                                          type: .NORMAL,
                                          uniqueName: "TEST_PUBLIC_GROUP_IOS_APP_THREAD_WITH_MESSAGE")
        let req = CreateThreadWithMessageRequest(createThreadInput: createThreadReq, sendMessageInput: threadMessage)
        Chat.sharedInstance.createThreadWithMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } messageUniqueId: { result in
            print(result)
        } completion: { response in
            print(response)
        } onSent: { result in
            print(result)
        } onDelivere: { result in
            print(result)
        } onSeen: { result in
            print(result)
        }

    }
    
    @IBAction func btnLeaveThreadTaped(_ button:UIButton) {
        Chat.sharedInstance.leaveThread(.init(threadId: 325183, clearHistory: true)) { resposne , error in
            print(resposne ?? "")
        }
    }
    
    @IBAction func btnLeaveThreadOldTaped(_ button:UIButton) {
        let req = LeaveThreadRequest(threadId: 318964, clearHistory: true, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.leaveThread(inputModel: req ) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
	
	@IBAction func btnThreadParticipantsTaped(_ button:UIButton) {
		Chat.sharedInstance.getThreadParticipants(.init(threadId: 318964)) { resposne , error in
			print(resposne ?? "")
		}
	}
	
	@IBAction func btnThreadParticipantsOldTaped(_ button:UIButton) {
		let req = GetThreadParticipantsRequest(admin: false, count: 50,
											   name: nil, offset: 0,
											   threadId: 318964,
											   typeCode: nil,
											   uniqueId: nil)
		
		Chat.sharedInstance.getThreadParticipants(inputModel: req , getCacheResponse: false) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		} cacheResponse: { response in
			print(response)
		}
	}
    
    @IBAction func btnCurrentUserRolesTaped(_ button:UIButton) {
		Chat.sharedInstance.getCurrentUserRoles(.init(threadId: 318964)) { resposne , error in
            print(resposne ?? "")
        }
    }
    
    @IBAction func btnCurrentUserRolesOldTaped(_ button:UIButton) {
        let req = GetCurrentUserRolesRequest(threadId: 318964, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.getCurrentUserRoles(inputModel: req , getCacheResponse: false) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        } cacheResponse: { response in
            print(response)
        }
    }
}

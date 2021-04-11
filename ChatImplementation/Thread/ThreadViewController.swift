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
	
    private let threadId = 460944
    private let participantId = 126255
    
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func btnGetThreadsTaped(_ button:UIButton) {
        Chat.sharedInstance.getThreads(.init()) { response, uniqueId , pagination , error in
            print(response ?? "")
        }cacheResponse: { threads, uniqueId  , pagination , error in
            print(threads ?? "")
        }uniqueIdResult: { uniqueId in
            print(uniqueId)
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
    
    @IBAction func btnGetAllThreadsTaped(_ button:UIButton) {
        Chat.sharedInstance.getAllThreads(request: .init()){ threads, uniqueId, error in
            print(threads ?? error ?? "")
        }
    }
    
	@IBAction func btnIsNameAvailableTaped(_ button:UIButton) {
		Chat.sharedInstance.isThreadNamePublic(.init(name:"TEST_PUBLIC_GROUP_IOS_APP_HAMED")) { threadName, uniqueId  , error in
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
		Chat.sharedInstance.muteThread(.init(threadId:threadId)) { threadId, uniqueId  , error in
            print(threadId ?? "" )
		}
	}
	
	@IBAction func btnMuteThreadOldTaped(_ button:UIButton) {
		let req = MuteUnmuteThreadRequest(subjectId: threadId, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.muteThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnUnMuteThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.unmuteThread(.init(threadId:threadId)) { threadId, uniqueId  , error in
			print(threadId ?? "")
		}
	}
	
	@IBAction func btnUnMuteThreadOldTaped(_ button:UIButton) {
		let req = MuteUnmuteThreadRequest(subjectId: threadId, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.unmuteThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnPinThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.pinThread(.init(threadId:threadId)) { threadId, uniqueId  , error in
            print(threadId ?? "")
		}
	}
	
	@IBAction func btnPinThreadOldTaped(_ button:UIButton) {
		let req = PinUnpinThreadRequest(threadId: threadId, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.pinThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnUnPinThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.unpinThread(.init(threadId:threadId)) { threadId, uniqueId  , error in
            print(threadId ?? "")
		}
	}
	
	@IBAction func btnUnPinThreadOldTaped(_ button:UIButton) {
		let req = PinUnpinThreadRequest(threadId: threadId, typeCode: nil, uniqueId: nil)
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
		Chat.sharedInstance.createThread(req) { response, uniqueId  , error in
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
									  uniqueName: "TEST PUBLIC GROUP IOS APP",
                                      typeCode: nil,
                                      uniqueId: nil
                                      )
		Chat.sharedInstance.createThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
    
    @IBAction func btnCreateThreadWithFileMessageTaped(_ button:UIButton) {
        let invites:[Invitee] = [
            Invitee(id: "\(24420613)", idType: .TO_BE_USER_CONTACT_ID)]
        let req = NewCreateThreadRequest(description: "خودت رو به خودت ثابت کن نه به دیگران",
                                      image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
                                      invitees: invites,
                                      metadata: "",
                                      title: "test create thread with file message 2",
                                      type: .PUBLIC_GROUP,
                                      uniqueName: "TEST_PUBLIC_GROUP_IOS_APP_HAMED_NEW2")
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let message = NewSendTextMessageRequest(threadId: threadId, textMessage: "test file upload message", messageType: .POD_SPACE_FILE)
        let uploadFile = NewUploadFileRequest(data: data,fileExtension: ".txt" , fileName: "test", mimeType: "text/plain" , userGroupHash: "RZFAGPKJEOWQIR")
        Chat.sharedInstance.createThreadWithFileMessage(req, textMessage: message, uploadFile: uploadFile) { uploadFileProgress,error in
            print(uploadFileProgress ?? error ?? "")
        } onSent: { sentResponse, uniqueId, error in
            print(sentResponse ?? "")
        }onSeen: { seenResponse, uniqueId, error in
            print(seenResponse ?? "")
        }onDeliver: { deliverResponse, uniqueId, error in
            print(deliverResponse ?? "")
        }createThreadCompletion: { thread, uniqueId, error in
            print(thread ?? error ?? "")
        }uploadUniqueIdResult:{ uploadUniqueId in
            print(uploadUniqueId)
        }messageUniqueIdResult:{ messageUniqueId in
           print(messageUniqueId)
        }

    }
    
    @IBAction func btnCreateThreadWithFileMessageOldTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let invites:[Invitee] = [
            Invitee(id: "ma.amjadi", idType: .TO_BE_USER_USERNAME)
        ]
        let createThreadRequest = CreateThreadRequest(description: "خودت رو به خودت ثابت کن نه به دیگران",
                                      image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
                                      invitees: invites,
                                      metadata: "",
                                      title: "test",
                                      type: .NORMAL,
                                      uniqueName: "TEST PUBLIC GROUP IOS APP",
                                      typeCode: nil,
                                      uniqueId: nil
                                      )
        let uploadrequest = UploadFileRequest(dataToSend: data,
                                              fileExtension: nil,
                                              fileName: "test",
                                              mimeType: nil,
                                              originalName: nil,
                                              userGroupHash: "RZFAGPKJEOWQIR",
                                              typeCode: nil,
                                              uniqueId: nil)
        let threadMessage = CreateThreadMessageInput(forwardedMessageIds: nil, repliedTo: nil, text: "HELLO", messageType: .TEXT, systemMetadata: nil, uniqueId: nil)
        let createTrhreadWithMessageRequest = CreateThreadWithMessageRequest(createThreadInput: createThreadRequest, sendMessageInput: threadMessage)
        let req = CreateThreadWithFileMessageRequest(creatThreadWithMessageInput: createTrhreadWithMessageRequest, uploadInput: uploadrequest)
        Chat.sharedInstance.createThreadWithFileMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } uploadProgress: { progress in
            print(progress)
        } uniqueId: { uniqueId in
            print(uniqueId)
        } createThreadCompletion: { response in
            print(response)
        } onSent: { response in
            print(response)
        } onDelivered: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }

    }
	
	@IBAction func btnAddParticipantToThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.addParticipant(.init(userName: "ma.amjadi", threadId:threadId)) { response, uniqueId  , error in
            print(response ?? "")
		}
	}
	
	@IBAction func btnAddParticipantToThreadOldTaped(_ button:UIButton) {
		let participants = AddParticipantsRequest(usernames: ["ma.amjadi"],
												  threadId: threadId ,
												  typeCode: nil,
												  uniqueId: nil)
		Chat.sharedInstance.addParticipants(inputModel: participants) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnRemoveParticipantFromThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.removeParticipants(.init(participantId: 126255, threadId: threadId)) { response, uniqueId  , error in
            print(response ?? "")
		}
	}
	
	@IBAction func btnRemoveParticipantFromThreadOldTaped(_ button:UIButton) {
		let participants = RemoveParticipantsRequest(participantIds: [126255],
													 threadId: threadId,
													 typeCode: nil,
													 uniqueId: nil)
		Chat.sharedInstance.removeParticipants(inputModel: participants) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnJoinThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.joinThread(.init(threadName: "TEST_PUBLIC_GROUP_IOS_APP_HAMED_3" )) { response, uniqueId  , error in
			print(response ?? "")
		}
	}
	
	@IBAction func btnJoinThreadOldTaped(_ button:UIButton) {
		let req = JoinPublicThreadRequest(uniqueName: "TEST_PUBLIC_GROUP_IOS_APP_HAMED_3", typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.joinThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnCloseThreadTaped(_ button:UIButton) {
        Chat.sharedInstance.closeThread(.init(threadId: threadId)) { threadId, uniqueId , error in
			print(threadId ?? "")
		}
	}
	
	@IBAction func btnCloseThreadOldTaped(_ button:UIButton) {
	
		let req = CloseThreadRequest(threadId: threadId , typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.closeThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnUpdateThreadInfoTaped(_ button:UIButton) {
        let req = NewUpdateThreadInfoRequest(threadId: threadId, title: "Channel nmae update ")
        Chat.sharedInstance.updateThreadInfo(req) { uniqueId in
            print(uniqueId)
        } uploadProgress: { progress in
            print(progress)
        } completion: { response, uniqueId, error in
           print(response ?? error ?? "")
        }
	}
	
	@IBAction func btnUpdateThreadInfoOldTaped(_ button:UIButton) {
		let req = UpdateThreadInfoRequest(description: nil,
										  metadata: nil,
										  threadId: threadId,
										  threadImage: nil,
										  title: "Channel nmae update old",
										  typeCode: nil,
										  uniqueId: nil)
			Chat.sharedInstance.updateThreadInfo(inputModel: req) { uploadUniqueId in
				print(uploadUniqueId)
			} uploadProgress: { progress in
				print(progress)
			} uniqueId: { uniqueId in
				print(uniqueId)
			} completion: { response in
				print(response)
			}
	}
    
    @IBAction func btnCreateThreadWithMessageTaped(_ button:UIButton) {
        let invites:[Invitee] = [
            Invitee(id: "s.khobbakht", idType: .TO_BE_USER_USERNAME)
        ]
        let threadMessage = CreateThreadMessage(text: "CREATE THREAD WITH MESSAGE TEXT 2", messageType: .TEXT)
        let req = CreateThreadWithMessage(description: "خودت رو به خودت ثابت کن نه به دیگران",
                                          image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
                                          invitees: invites,
                                          metadata: "",
                                          title: "Thread with message",
                                          type: .NORMAL,
                                          uniqueName: nil,
                                          message: threadMessage)
		
		Chat.sharedInstance.createThreadWithMessage(req) { uniqueId in
			print(uniqueId)
		} onSent: { onSentResult , uniqueId , error in
			print(onSentResult ?? "")
		} onDelivery: { onDeliveryResult , uniqueId, error in
			print(onDeliveryResult ?? "")
		} onSeen: { onSeenResult, uniqueId , error  in
            print(onSeenResult ?? "")
		} completion: { response, uniqueId , error in
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
                                          uniqueName: "TEST_PUBLIC_GROUP_IOS_APP_THREAD_WITH_MESSAGE",
                                          typeCode: nil,
                                          uniqueId: nil
                                          )
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
        Chat.sharedInstance.leaveThread(.init(threadId: threadId, clearHistory: true)) { resposne, uniqueId , error in
            print(resposne ?? "")
        }
    }
    
    @IBAction func btnLeaveThreadOldTaped(_ button:UIButton) {
        let req = LeaveThreadRequest(threadId: threadId, clearHistory: true, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.leaveThread(inputModel: req ) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
    
    @IBAction func btnReplaceAdminAndLeaveThread(_ button:UIButton) {
        Chat.sharedInstance.leaveThreadSaftly(.init(threadId: threadId, participantId: participantId)) { thread, uniqueId, error in
            print(thread ?? error ?? "")
        } newAdminCompletion: { usersRoles, uniqueId, error in
            print(usersRoles ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
        }

    }
    
    @IBAction func btnReplaceAdminAndLeaveOldThread(_ button:UIButton) {
        let req = SafeLeaveThreadRequest(threadId: threadId, clearHistory: false, participantId: participantId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.leaveThreadSaftly(inputModel: req) { uniqueId in
            print(uniqueId)
        } addAdminCallback: { response in
            print(response)
        } leaveThreadCallback: { response in
            print(response)
        }

    }
	
	@IBAction func btnThreadParticipantsTaped(_ button:UIButton) {
		Chat.sharedInstance.getThreadParticipants(.init(threadId: threadId)) { resposne, uniqueId , pagination , error in
			print(resposne ?? "")
        }cacheResponse: { participants, uniqueId , pagination , error in
            print(participants ?? "")
        }
	}
	
	@IBAction func btnThreadParticipantsOldTaped(_ button:UIButton) {
		let req = GetThreadParticipantsRequest(admin: false, count: 50,
											   name: nil, offset: 0,
											   threadId: threadId,
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
		Chat.sharedInstance.getCurrentUserRoles(.init(threadId: threadId)) { resposne, uniqueId , error in
            print(resposne ?? "")
        }cacheResponse: { roles, uniqueId, error in
            print(roles ?? "")
        }
    }
    
    @IBAction func btnCurrentUserRolesOldTaped(_ button:UIButton) {
        let req = GetCurrentUserRolesRequest(threadId: threadId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.getCurrentUserRoles(inputModel: req , getCacheResponse: false) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        } cacheResponse: { response in
            print(response)
        }
    }
    
    @IBAction func btnStartTypingTaped(_ button:UIButton) {
        Chat.sharedInstance.snedStartTyping(threadId: threadId)
    }
    
    @IBAction func btnStartTypingOldTaped(_ button:UIButton) {
        Chat.sharedInstance.startTyping(threadId: threadId)
    }
    
    @IBAction func btnStopTypingTaped(_ button:UIButton) {
        Chat.sharedInstance.sendStopTyping()
    }
    
    @IBAction func btnStopTypingOldTaped(_ button:UIButton) {
        Chat.sharedInstance.stopTyping()
    }
    
    @IBAction func btnSpamThreadTaped(_ button:UIButton) {
        Chat.sharedInstance.spamPvThread(.init(threadId:threadId)){ response, uniqueId , error  in
            print(response ?? "")
        }
    }
    
    @IBAction func btnSpamThreadOldTaped(_ button:UIButton) {
        let req = SpamPrivateThreadRequest(threadId: threadId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.spamPvThread(inputModel: req) { uniqueId in
            print(uniqueId)
        } completions: { response in
            print(response)
        }
    }
    
    @IBAction func btnRegisterAsstistantTaped(_ button:UIButton) {
        let invitee = Invitee(id: "24420613", idType: .TO_BE_USER_CONTACT_ID)
        let roles:[Roles] = [.READ_THREAD , .EDIT_THREAD, .ADD_RULE_TO_USER]
        let assistant = Assistant(assistant: invitee, contactType: "default", roleTypes: roles)
        Chat.sharedInstance.registerAssistat(.init(assistants: [assistant])) { assistants, uniqueId, error in
            print(assistants ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnDeactiveAsstistantTaped(_ button:UIButton) {
        let invitee = Invitee(id: "24420613", idType: .TO_BE_USER_CONTACT_ID)
//        let invitee1 = Invitee(id: "1233", idType: .TO_BE_USER_CONTACT_ID)
        let assistants:[Assistant] = [.init(assistant: invitee)]
        Chat.sharedInstance.deactiveAssistant(.init(assistants: assistants)) { deactivatedAssistants, uniqueId, error in
            print(deactivatedAssistants ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnGetAsstistantsTaped(_ button:UIButton) {
        let req = AssistantsRequest(contactType: "default")
        Chat.sharedInstance.getAssistats(req) {  assistants, uniqueId, error in
            print(assistants ?? error ?? "")
        } uniqueIdResult: {  uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnGetAsstistantsHistoryTaped(_ button:UIButton) {
        Chat.sharedInstance.getAssistatsHistory(){  assistantsActions, uniqueId, error in
            print(assistantsActions ?? error ?? "")
        } uniqueIdResult: {  uniqueId in
            print(uniqueId)
        }
    }
    
}

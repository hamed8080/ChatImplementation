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
		Chat.sharedInstance.request(.MuteThread(threadId:318964)) { response in
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
	
	@IBAction func btnUnMuteThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.request(.UnMuteThread(threadId:318964)) { response in
			if let availableName = response.result as? UnMuteThreadResponse{
				print(availableName)
			}
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
		Chat.sharedInstance.request(.PinThread(threadId:318964)) { response in
			if let availableName = response.result as? PinThreadResponse{
				print(availableName)
			}
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
		Chat.sharedInstance.request(.UnPinThread(threadId:318964)) { response in
			if let availableName = response.result as? UnPinThreadResponse{
				print(availableName)
			}
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
		let req = CreateThreadRequest(description: "خودت رو به خودت ثابت کن نه به دیگران",
									  image: "http://www.careerbased.com/themes/comb/img/avatar/default-avatar-male_14.png",
									  invitees: invites,
									  metadata: "",
									  title: "test",
									  type: .PUBLIC_GROUP,
									  uniqueName: "TEST_PUBLIC_GROUP_IOS_APP_HAMED",
									  typeCode: nil,
									  uniqueId: nil)
		Chat.sharedInstance.request(.CreateThread(req: req)) { response in
			if let conversation = response.result as? Conversation{
				print(conversation)
			}
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
									  uniqueId: nil)
		Chat.sharedInstance.createThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	
	@IBAction func btnAddParticipantToThreadTaped(_ button:UIButton) {
		Chat.sharedInstance.request(.AddParticipant(threadId: 318964,req: .init(userName: "ma.amjadi"))) { response in
			if let conversation = response.result as? Conversation{
				print(conversation)
			}
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
		Chat.sharedInstance.request(.RemoveParticipant(threadId: 318964,participantId: 126255)) { response in
			if let participants = response.result as? [Participant]{
				print(participants)
			}
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
		Chat.sharedInstance.request(.JoinThread(uniqueName: "TEST_PUBLIC_GROUP_IOS_APP_HAMED")) { response in
			print(response)
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
		Chat.sharedInstance.request(.CloseThread(threadId: 318964)) { response in
			print(response)
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
		Chat.sharedInstance.request(.UpdateThread(threadId: 318964)) { response in
			print(response)
		}
	}
	
	@IBAction func btnUpdateThreadInfoOldTaped(_ button:UIButton) {
		
		let req = CloseThreadRequest(threadId: 318964 , typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.closeThread(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
}

//
//  UserViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/20/21.
//

import Foundation
import UIKit
import FanapPodChatSDK

class UserViewController : UIViewController{
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func btnGetUserInfoTaped(_ button:UIButton) {
		Chat.sharedInstance.request(.UserInfo) { response in
			if let user = response.result as? User{
				print(user)
			}
		}
	}
	
	@IBAction func btnGetUserInfoOldTaped(_ button:UIButton) {
		Chat.sharedInstance.getUserInfo(getCacheResponse: false) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		} cacheResponse: { response in
			print(response)
		}
	}
	
	@IBAction func btnSetProfileTaped(_ button:UIButton) {
		let req = UpdateChatProfileRequest(bio: "my awesome bio")
		Chat.sharedInstance.request(.SetProfile(req: req)) { response in
			if let profile = response.result as? Profile{
				print(profile)
			}
		}
	}
	
	@IBAction func btnSetProfileOldTaped(_ button:UIButton) {
		let req  = UpdateChatProfileRequest(bio: "test", metadata: nil, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.setProfile(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	
	@IBAction func btnSendStatusPingTaped(_ button:UIButton) {
		Chat.sharedInstance.request(.SendStatusPing(req: .init(statusType: .CHAT, threadId: 325183))) { response in
			if let profile = response.result as? Profile{
				print(profile)
			}
		}
	}
	
	@IBAction func btnSendStatusPingOldTaped(_ button:UIButton) {
		let req  = StatusPingRequest(insideChat: true, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.sendStatusPing(inputModel: req)
	}
	
}

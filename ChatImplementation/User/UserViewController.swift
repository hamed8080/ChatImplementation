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
	
    let threadId = 416372
    let userId   = 3637251
    
	@IBAction func btnGetUserInfoTaped(_ button:UIButton) {
		Chat.sharedInstance.getUserInfo(.init()) { response, uniqueId , error in
            print(response ?? "")
        }cacheResponse: { user, uniqueId , error in
            print(user ?? "")
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
		Chat.sharedInstance.setProfile(.init(bio:"my awesome bio")) { response, uniqueId , error in
			print(response ?? "")
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
		Chat.sharedInstance.sendStatusPing(.init(statusType: .CHAT, threadId: 325183))
	}
	
	@IBAction func btnSendStatusPingOldTaped(_ button:UIButton) {
		let req  = StatusPingRequest(insideChat: true, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.sendStatusPing(inputModel: req)
	}
    
    @IBAction func btnLogoutTaped(_ button:UIButton) {
        Chat.sharedInstance.newlogOut()
    }
    
    @IBAction func btnSetRolesTaped(_ button:UIButton) {
        let usersRoles:[UserRoleRequest] = [.init(userId: userId, roles: [.THREAD_ADMIN , .EDIT_MESSAGE_OF_OTHERS])]
        Chat.sharedInstance.setRoles(.init(userRoles: usersRoles, threadId: threadId)) { usersRoles, uniqueId, error in
            print(usersRoles ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnSetRolesOldTaped(_ button:UIButton) {
        let userRoles:[SetRemoveRoleModel] = [.init(userId: userId, roles: [.THREAD_ADMIN , .EDIT_THREAD])]
        let req = RoleRequestModel(userRoles: userRoles, threadId: threadId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.setRole(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }

    }
    
    @IBAction func btnRemoveRolesTaped(_ button:UIButton) {
        let usersRoles:[UserRoleRequest] = [.init(userId: userId, roles: [.THREAD_ADMIN , .EDIT_MESSAGE_OF_OTHERS , .EDIT_THREAD])]
        Chat.sharedInstance.removeRoles(.init(userRoles: usersRoles, threadId: threadId)) { usersRoles, uniqueId, error in
            print(usersRoles ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnRemoveRolesOldTaped(_ button:UIButton) {
        let userRoles:[SetRemoveRoleModel] = [.init(userId: userId, roles: [.THREAD_ADMIN , .EDIT_THREAD])]
        let req = RoleRequestModel(userRoles: userRoles, threadId: threadId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.removeRole(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
    
    
    @IBAction func btnSetAuditorTaped(_ button:UIButton) {
        let userRoleRequest = UserRoleRequest(userId: userId, roles: [.THREAD_ADMIN , .EDIT_MESSAGE_OF_OTHERS , .EDIT_THREAD])
        Chat.sharedInstance.setAuditor(.init(userRoleRequest: userRoleRequest, threadId: threadId)) { usersRoles, uniqueId, error in
            print(usersRoles ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnSetAuditorOldTaped(_ button:UIButton) {
        let req = AddRemoveAuditorRequestModel(roles: [.THREAD_ADMIN , .EDIT_THREAD], threadId: threadId, userId: userId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.setAuditor(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
    
    @IBAction func btnRemoveAuditorTaped(_ button:UIButton) {
        let userRoleRequest = UserRoleRequest(userId: userId, roles: [.THREAD_ADMIN , .EDIT_MESSAGE_OF_OTHERS , .EDIT_THREAD])
        Chat.sharedInstance.removeAuditor(.init(userRoleRequest: userRoleRequest, threadId: threadId)) { usersRoles, uniqueId, error in
            print(usersRoles ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnRemoveAuditorOldTaped(_ button:UIButton) {
        let req = AddRemoveAuditorRequestModel(roles: [.THREAD_ADMIN , .EDIT_THREAD], threadId: threadId, userId: userId, typeCode: nil, uniqueId: nil)
        Chat.sharedInstance.removeAuditor(inputModel: req) { uniqueId in
            print(uniqueId)
        } completion: { response in
            print(response)
        }
    }
    
}

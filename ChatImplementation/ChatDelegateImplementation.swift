//
//  ChatDelegateImplementation.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/6/21.
//

import Foundation
import FanapPodChatSDK

class ChatDelegateImplementation: ChatDelegates {
    
    //Sandbox
//    let socketAddresss = "wss://chat-sandbox.pod.ir/ws"
//    let serverName     = "chat-server"
//    let ssoHost        = "https://accounts.pod.ir"
//    let platformHost   = "https://sandbox.pod.ir:8043/srv/basic-platform"
//    let fileServer     = "http://sandbox.fanapium.com:8080"
    
    //Main
    
    let socketAddresss = "wss://msg.pod.ir/ws"
    let serverName     = "chat-server"
    let ssoHost        = "https://accounts.pod.ir"
    let platformHost   = "https://api.pod.ir/srv/core"
    let fileServer     = "https://core.pod.ir"
    
	private (set) static var sharedInstance = ChatDelegateImplementation()
    
    func createChatObject(){
		let token = UserDefaults.standard.string(forKey: "token")
		print("token is: \(token ?? "")")
		Chat.sharedInstance.createChatObject(object: .init(socketAddress: socketAddresss,
														   serverName: serverName,
														   token: token ?? "INVALID_TOKEN_TO_GET_NEW_ONE",
														   ssoHost: ssoHost,
														   platformHost: platformHost,
														   fileServer: fileServer,
                                                           enableCache: true,
														   reconnectOnClose: true,
                                                           isDebuggingLogEnabled: true
		))
		
//        Chat.sharedInstance.createChatObject(socketAddress:             "String",
//                                             ssoHost:                   "String",
//                                             platformHost:              "String",
//                                             fileServer:                "String",
//                                             serverName:                "String",
//                                             token:                     "String",
//                                             mapApiKey:                 "String",
//                                             mapServer:                 "String",
//                                             typeCode:                  "String",
//                                             enableCache:               false,
//                                             cacheTimeStampInSec:       nil,
//                                             msgPriority:               nil,
//                                             msgTTL:                    nil,
//                                             httpRequestTimeout:        nil,
//                                             actualTimingLog:           nil,
//                                             wsConnectionWaitTime:      0,
//                                             connectionRetryInterval:   0,
//                                             connectionCheckTimeout:    0,
//                                             messageTtl:                0,
//                                             getDeviceIdFromToken:      false,
//                                             captureLogsOnSentry:       false,
//                                             maxReconnectTimeInterval:  0,
//                                             reconnectOnClose:          false,
//                                             localImageCustomPath:      nil,
//                                             localFileCustomPath:       nil,
//                                             deviecLimitationSpaceMB:   nil,
//                                             showDebuggingLogLevel:     nil)
		Chat.sharedInstance.delegate = self
    }
	
	func chatConnect() {
        print("chat connected")
	}
	
	func chatDisconnect() {
        print("chat Disconnect")
	}
	
	func chatReconnect() {
		print("chat Reconnect")
	}
	
	func chatReady(withUserInfo: User) {
        print("chat ready Called\(withUserInfo)")
	}
	
	func chatState(state: AsyncStateType) {
		print("chat state changed: \(state)")
	}
	
	func chatError(errorCode: Int, errorMessage: String, errorResult: Any?) {
		if errorCode == 21  || errorCode == 401{
            let st = UIStoryboard(name: "Main", bundle: nil)
            let vc = st.instantiateViewController(identifier: "UpdateTokenController")
            guard let rootVC = SceneDelegate.getRootViewController() else {return}
            rootVC.presentedViewController?.dismiss(animated: true)
            rootVC.present(vc, animated: true)
		}
	}
	
	func botEvents(model: BotEventModel) {
		print(model)
	}
	
	func contactEvents(model: ContactEventModel) {
		print(model)
	}
	
	func fileUploadEvents(model: FileUploadEventModel) {
		print(model)
	}
	
	func messageEvents(model: MessageEventModel) {
		print(model)
	}
	
	func systemEvents(model: SystemEventModel) {
		print(model)
	}
	
	func threadEvents(model: ThreadEventModel) {
		print(model)
	}
	
	func userEvents(model: UserEventModel) {
		print(model)
	}
}

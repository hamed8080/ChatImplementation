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
		Chat.sharedInstance.createChatObject(object: .init(socketAddress: socketAddresss,
														   serverName: serverName,
														   token: token ?? "INVALID_TOKEN_TO_GET_NEW_ONE",
														   ssoHost: ssoHost,
														   platformHost: platformHost,
														   fileServer: fileServer,
                                                           enableCache: true,
														   reconnectOnClose: true
		))
		Chat.sharedInstance.delegate = self
    }
	
	func chatConnect() {
        
	}
	
	func chatDisconnect() {
	}
	
	func chatReconnect() {
		
	}
	
	func chatReady(withUserInfo: User) {
        
	}
	
	func chatState(state: AsyncStateType) {
		
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

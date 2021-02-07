//
//  ViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 1/26/21.
//

import UIKit
import FanapPodChatSDK

class ViewController: UIViewController{
	
	
	@IBOutlet weak var tfNewToken: UITextField!
	@IBOutlet weak var txtTokenExpired: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		Chat.sharedInstance.delegate = self
		// Do any additional setup after loading the view.
		// Chat.sharedInstance.delegate = self
		
		//Sandbox
		//		let socketAddresss = "wss://chat-sandbox.pod.ir/ws"
		//		let serverName = "chat-server"
		//		let ssoHost = "https://accounts.pod.ir"
		//		let platformHost = "https://sandbox.pod.ir:8043/srv/basic-platform"
		//		let fileServer = "http://sandbox.fanapium.com:8080"
		//Main
		let socketAddresss = "wss://msg.pod.ir/ws"
		let serverName = "chat-server"
		let ssoHost = "https://accounts.pod.ir"
		let platformHost = "https://api.pod.ir/srv/core"
		let fileServer = "https://core.pod.ir"
		
		Chat.sharedInstance.createChatObject(object:.init(socketAddress: socketAddresss,
														  serverName: serverName,
														  token: "35097e8ea8ea4c699520914235d08351",
														  ssoHost: ssoHost,
														  platformHost: platformHost,
														  fileServer: fileServer
		))
		//
		//		Chat.sharedInstance.createChatObject(socketAddress: socketAddresss, ssoHost: ssoHost, platformHost: platformHost, fileServer: fileServer, serverName: serverName, token: "2126fb29cc2e40e1bf52736b80fc2402", mapApiKey: nil, mapServer: "https://api.neshan.org/v1", typeCode: nil, enableCache: false, cacheTimeStampInSec: nil, msgPriority: nil, msgTTL: nil, httpRequestTimeout: nil, actualTimingLog: nil, wsConnectionWaitTime: 10, connectionRetryInterval: 10, connectionCheckTimeout: 10, messageTtl: 100, getDeviceIdFromToken: false, captureLogsOnSentry: false, maxReconnectTimeInterval: nil, reconnectOnClose: true, localImageCustomPath: nil, localFileCustomPath: nil, deviecLimitationSpaceMB: nil, showDebuggingLogLevel: nil)
	}

	
	@IBAction func btnNewTokenTaped(_ sender: UIButton) {
		guard let newToken = tfNewToken.text else {return}
		Chat.sharedInstance.setToken(newToken: newToken)
		txtTokenExpired.isHidden = true
	}
	
	@IBAction func btnGetContactsTaped(_ sender: UIButton) {
		Chat.sharedInstance.getContacts(inputModel: .init(count: 10, offset: 0 , query: "up")) { (result) in
			print(result)
		}
	}
	
	@IBAction func btnOldGetContactsTaped(_ sender: UIButton) {
		let contactModel = GetContactsRequest(count: 10, offset: 0, query: nil, typeCode: nil, uniqueId: "myUniqueId" )
		Chat.sharedInstance.getContacts(inputModel: contactModel, getCacheResponse: false) { (uniqueId) in
			print(uniqueId)
		} completion: { (result) in
			print(result)
		} cacheResponse: { (casheContactModel) in
			print(casheContactModel)
		}
	}
	
}


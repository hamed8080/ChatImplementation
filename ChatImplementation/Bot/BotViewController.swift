//
//  BotViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/11/21.
//

import UIKit
import FanapPodChatSDK
import SwiftyJSON

class BotViewController: UIViewController {
    
	 private final let threadId     = 461065
	 private final let botName      = "TEST_IOS_4_BOT"
     private final let messageId    = 11233
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func btnCreateBotTaped(_ sender: UIButton) {
		Chat.sharedInstance.createBot(.init(botName: botName)) { resposne , uniqueId , error in
            print(resposne ?? "")
		}
	}
	
	@IBAction func btnCreateBotOldTaped(_ sender: UIButton) {
		let req = CreateBotRequest(botName: botName , typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.createBot(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnCreateBotCommandTaped(_ sender: UIButton) {
		let commands = ["/command1","/command1"]
		Chat.sharedInstance.addBotCommand(.init(botName : botName ,commandList:commands)) { resposne, uniqueId  , error in
            print(resposne ?? "")
		}
	}
	
	@IBAction func btnCreateBotCommandOldTaped(_ sender: UIButton) {
		let commands = ["/command1","/command1"]
		let req = AddBotCommandRequest(botName: botName, commandList: commands, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.addBotCommand(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnAddBotToThreadTaped(_ sender: UIButton) {
		Chat.sharedInstance.addParticipant( .init(userName: botName, threadId: threadId)) { resposne, uniqueId  , error in
            print(resposne ?? "")
		}
	}
	
	@IBAction func btnStartBotTaped(_ sender: UIButton) {
		Chat.sharedInstance.startBot(.init(botName: botName, threadId: threadId)) { botName, uniqueId  , error in
            print(botName ?? "")
		}
	}
	
	@IBAction func btnStartBotOldTaped(_ sender: UIButton) {
		let req = StartStopBotRequest(botName: botName,
									  threadId: threadId,
									  typeCode: nil,
									  uniqueId: nil)
		Chat.sharedInstance.startBot(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnStopBotTaped(_ sender: UIButton) {
        Chat.sharedInstance.stopBot(.init(botName: botName, threadId: threadId)) { botName, uniqueId  , error in
            print(botName ?? "")
		}
	}
	
	@IBAction func btnStopBotOldTaped(_ sender: UIButton) {
		let req = StartStopBotRequest(botName: botName,
									  threadId: threadId,
									  typeCode: nil,
									  uniqueId: nil)
		Chat.sharedInstance.stopBot(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
    
    @IBAction func btnSendBotMessageTaped(_ button:UIButton) {
//        Chat.sharedInstance.sendBotMessage()
    }
    
    @IBAction func btnSendBotMessageOldTaped(_ button:UIButton) {
        let metadata: JSON = ["id": 2341234123, "type": "BOT_MESSAGE" , "owner": "Mahyar"]
        let req = SendInteractiveMessageRequest(messageId: messageId,
                                                metadata: metadata.stringValue,
                                                systemMetadata: nil,
                                                textMessage: "test intractive",
                                                typeCode: nil,
                                                uniqueId: nil)
        Chat.sharedInstance.sendInteractiveMessage(inputModel: req) { uniqueId in
            print(uniqueId)
        } onSent: { response in
            print(response)
        } onDelivered: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }
    }
	
}

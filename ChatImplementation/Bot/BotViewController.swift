//
//  BotViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/11/21.
//

import UIKit
import FanapPodChatSDK

class BotViewController: UIViewController {
    
	 final let threadId = 325183
	 final let botName = "TEST_IOS_3_BOT"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func btnCreateBotTaped(_ sender: UIButton) {
		Chat.sharedInstance.request(.CreateBot(botName: botName)) { resposne in
			if let bot = resposne.result as? Bot{
				print(bot)
			}
		}
	}
	
	@IBAction func btnCreateBotOldTaped(_ sender: UIButton) {
		let req = CreateBotRequest(botName: botName)
		Chat.sharedInstance.createBot(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnCreateBotCommandTaped(_ sender: UIButton) {
		let commands = ["/command1","/command1"]
		Chat.sharedInstance.request(.CreateBotCommand(req: .init(botName : botName ,commandList:commands) )) { resposne in
			if let bot = resposne.result as? BotInfo{
				print(bot)
			}
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
		
		let req = AddParticipantRequest(userName: botName)
		Chat.sharedInstance.request(.AddParticipant(threadId:threadId , req: req)) { resposne in
			if let thread = resposne.result as? Conversation{
				print(thread)
			}
		}
	}
	
	@IBAction func btnStartBotTaped(_ sender: UIButton) {
		Chat.sharedInstance.request(.StartBot(req: .init(botName: botName, threadId: threadId))) { resposne in
			if let botName = resposne.result as? String{
				print(botName)
			}
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
		Chat.sharedInstance.request(.StopBot(req: .init(botName: botName, threadId: threadId))) { resposne in
			if let botName = resposne.result as? String{
				print(botName)
			}
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
	
}

//
//  StoryBrain.swift
//  Destini-ios26
//
//  Created by 程式猿 on 2021/2/24.
//

import Foundation


struct StoryBrain {
    
    var currentStoryID = "start"
    
    let stories = [
        "start": Story(
            id: "start",
            title: "你想成為程式設計師嗎？",
            choice1: "不想！", choice1Destination: "quit",
            choice2: "我想！！", choice2Destination: "frontend"
        ),
        "frontend": Story(
            id: "frontend",
            title: "你想成為前端網站設計師嗎？",
            choice1: "有點想", choice1Destination: "quit",
            choice2: "我美術不太好", choice2Destination: "math_logic"
        ),
        "quit": Story(
            id: "quit",
            title: "為什麼呢？寫程式很香啊。",
            choice1: "打電動比較香", choice1Destination: "gamer",
            choice2: "我數學不好", choice2Destination: "math_study"
        ),
        "ipad_practice": Story(
            id: "ipad_practice",
            title: "那你先回家買台 iPad 跟 Apple Pencil 練習吧",
            choice1: "好", choice1Destination: "start",
            choice2: "知道", choice2Destination: "start"
        ),
        "math_study": Story(
            id: "math_study",
            title: "那你先回家學數學吧",
            choice1: "加加油", choice1Destination: "start",
            choice2: "努力學", choice2Destination: "start"
        ),
        "gamer": Story(
            id: "gamer",
            title: "好吧你可以回家打電動了",
            choice1: "掰掰", choice1Destination: "start",
            choice2: "再見", choice2Destination: "start"
        ),
        "math_logic": Story(
            id: "math_logic",
            title: "寫程式邏輯也很重要喔！準備好挑戰了嗎？",
            choice1: "準備好了", choice1Destination: "start",
            choice2: "再想想", choice2Destination: "start"
        )
    ]
    
    func getStoryTitle() -> String {
        return stories[currentStoryID]?.title ?? "完結"
    }
    
    func getChoice1() -> String {
        return stories[currentStoryID]?.choice1 ?? "回首頁"
    }
    
    func getChoice2() -> String {
        return stories[currentStoryID]?.choice2 ?? "回首頁"
    }
    
    mutating func nextStory(userChoice: String) {
        let currentStory = stories[currentStoryID]
        if userChoice == currentStory?.choice1 {
            currentStoryID = currentStory?.choice1Destination ?? "start"
        } else if userChoice == currentStory?.choice2 {
            currentStoryID = currentStory?.choice2Destination ?? "start"
        }
    }
}

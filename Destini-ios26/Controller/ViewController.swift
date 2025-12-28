//
//  ViewController.swift
//  Destini-ios26
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI(animated: false)
    }
    
    func setupUI() {
        // Apply futuristic styles
        storyTextView.font = DesignSystem.Fonts.futuristicTitle()
        storyTextView.textColor = DesignSystem.Colors.textPrimary
        storyTextView.backgroundColor = .clear
        
        [choice1Button, choice2Button].forEach { button in
            button?.titleLabel?.font = DesignSystem.Fonts.futuristicBody()
            button?.setTitleColor(DesignSystem.Colors.textPrimary, for: .normal)
            DesignSystem.applyGlassStyle(to: button!)
        }
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let selectionFeedback = UISelectionFeedbackGenerator()
        selectionFeedback.selectionChanged()
        
        // Simple scale animation on tap
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }
        
        storyBrain.nextStory(userChoice: sender.currentTitle ?? "")
        updateUI(animated: true)
    }
    
    func updateUI(animated: Bool) {
        if animated {
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = .fade
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            storyTextView.layer.add(transition, forKey: kCATransition)
            choice1Button.layer.add(transition, forKey: kCATransition)
            choice2Button.layer.add(transition, forKey: kCATransition)
        }
        
        storyTextView.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
        
        // Dynamic background adjustment (simulated mesh gradient shift)
        UIView.animate(withDuration: 1.0) {
            self.view.backgroundColor = self.storyBrain.currentStoryID == "start" ? 
                UIColor(red: 0.05, green: 0.05, blue: 0.15, alpha: 1.0) : 
                UIColor(red: 0.1, green: 0.05, blue: 0.2, alpha: 1.0)
        }
    }
}

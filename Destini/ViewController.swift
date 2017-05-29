//
//  ViewController.swift
//  Destini
//

import UIKit



class ViewController: UIViewController {

    class StoryStep {
        let script : String
        let ansA : String
        let ansB : String
        init(text : String, firstAnswer : String, secondAnswer : String) {
            script = text
            ansA = firstAnswer
            ansB = secondAnswer
        }
    }
    
    class StoryStepBank {
        var list = [StoryStep] ()
        
        init () {
            
            list.append(StoryStep(text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".", firstAnswer: "I\'ll hop in. Thanks for the help!", secondAnswer: "Better ask him if he\'s a murderer first."))
            
            list.append(StoryStep(text: "He nods slowly, unphased by the question.", firstAnswer: "At least he\'s honest. I\'ll climb in.", secondAnswer: "Wait, I know how to change a tire."))
            
            list.append(StoryStep(text: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.", firstAnswer: "I love Elton John! Hand him the cassette tape.", secondAnswer: "It\'s him or me! You take the knife and stab him."))
            
            list.append(StoryStep(text: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?", firstAnswer: "", secondAnswer: ""))
            
            list.append(StoryStep(text: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", firstAnswer: "", secondAnswer: ""))
            
            list.append(StoryStep(text: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"" , firstAnswer: "", secondAnswer: ""))
        }
    }
    
    let allStory = StoryStepBank()
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    
    var storyIndex : Int = 1
    var myAnswer : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyIndex = 1
        updateBtns()
        print(storyIndex)
        
    }


    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        // TODO Step 4: Write an IF-Statement to update the views
        
            if sender.tag == 1 {
                myAnswer = 1
            }
            if sender.tag == 2 {
                myAnswer = 2
            }
        createStoryStep()
        
    }
    
    func createStoryStep () {
        print(myAnswer)
        if storyIndex == 1 {
            if myAnswer == 1 {
                storyIndex = 3
                updateBtns()
            }
            else if myAnswer == 2 {
                storyIndex = 2
                updateBtns()
            }
        }
        else if storyIndex == 2 {
            if myAnswer == 1 {
                storyIndex = 3
                updateBtns()
            }
            else if myAnswer == 2  {
                storyIndex = 4
                updateBtns()
            }
            
        }
        else if storyIndex == 3 {
            if myAnswer == 1 {
                storyIndex = 6
                updateBtns()
            }
            else if myAnswer == 2  {
                storyIndex = 5
                updateBtns()
            }
            
        }
        else if storyIndex == 99 {
            let alert = UIAlertController(title: "All done here", message: "You have reached the end of the game", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func startOver () {
        
        storyIndex = 1
        bottomButton.isHidden = false
        updateBtns()
        
    }
    
    func updateBtns () {
        storyTextView.text = allStory.list[storyIndex-1].script
        topButton.setTitle(allStory.list[storyIndex-1].ansA, for: .normal)
        bottomButton.setTitle(allStory.list[storyIndex-1].ansB, for: .normal)
        if storyIndex == 5 || storyIndex == 6 || storyIndex == 4 {
            topButton.setTitle("The End", for: .normal)
            bottomButton.isHidden = true
            storyIndex = 99
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


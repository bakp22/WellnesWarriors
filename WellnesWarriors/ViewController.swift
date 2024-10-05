//
//  ViewController.swift
//  WellProject
//
//  Created by Beren Akpinar on 10/5/24.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    // MARK: UI
    
    
    private lazy var responseLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = ""
            label.numberOfLines = 2
            label.font = .systemFont(ofSize: 20, weight: .regular)
            label.textAlignment = .center
            label.textColor = .darkGray
            return label
        }()
    
    private lazy var result: UILabel = {
        let resultfactor = UILabel()
        resultfactor.translatesAutoresizingMaskIntoConstraints = false
        resultfactor.text = " "
        resultfactor.textAlignment = .center
        resultfactor.numberOfLines = 0
        return resultfactor
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hi Nadine,"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 50, weight: .bold)
        return label
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How are you feeling today?"
        label.font = .systemFont(ofSize: 30 , weight: .bold)
        return label
    }()
    
    private lazy var neutralFace: UIImageView = {
        let ok = UIImageView()
        ok.translatesAutoresizingMaskIntoConstraints = false
        ok.image = UIImage(named: "okay.png")
        ok.contentMode = .scaleAspectFit  // Adjust the content mode as needed
        return ok
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        return slider
    }()
    
    
    private lazy var journalLabel: UILabel = {
        let label = UILabel()
        label.text = "Journal Entry"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var submitButton: UIButton = {
            let button = UIButton()
            button.setTitle("Submit Entry", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(submitEntry), for: .touchUpInside)
            button.backgroundColor = .tintColor
            button.layer.cornerRadius = 5
            return button
        }()
    
    private lazy var journalEntry: UITextView = {
        let entry = UITextView()
        
        entry.backgroundColor = .white
        entry.layer.cornerRadius = 10
        entry.translatesAutoresizingMaskIntoConstraints = false
        entry.layer.borderWidth = 2


        return entry
        
    }()
    
    private lazy var sadFace: UIImageView = {
            let sad = UIImageView()
            sad.translatesAutoresizingMaskIntoConstraints = false
            sad.contentMode = .scaleAspectFit  // Adjust the content mode as needed
            sad.image = UIImage(named: "sad.png")  // Replace with your image name
            return sad
        }()
    
    private lazy var happyFace: UIImageView = {
            let happy = UIImageView()
            happy.translatesAutoresizingMaskIntoConstraints = false
            happy.contentMode = .scaleAspectFit  // Adjust the content mode as needed
            happy.image = UIImage(named: "happy.png")  // Replace with your image name
            return happy
        }()
    
    
    
    override func loadView() {
        super.loadView()
        setup()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
    }
    
    // MARK: - UITextViewDelegate

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if text == "\n" { // Check if the Enter key was pressed
                submitEntry()
                return false // Prevent the newline character from being added
            }
            return true
        }
    
}

private extension ViewController {
    
    func setup() {
        self.view.addSubview(sadFace)
        self.view.addSubview(happyFace)
        self.view.addSubview(journalEntry)
        self.view.addSubview(journalLabel)
        self.view.addSubview(submitButton)
        self.view.addSubview(slider)
        self.view.addSubview(neutralFace)
        self.view.addSubview(labelTitle)
        self.view.addSubview(labelName)
        self.view.addSubview(result)
        self.view.addSubview(responseLabel)
      

        NSLayoutConstraint.activate([
                  // Constraints for responseLabel
                  responseLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 40),
                  responseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  responseLabel.widthAnchor.constraint(equalToConstant: 300),
              ])
              
        
        NSLayoutConstraint.activate([
            result.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            result.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 110),
            ])
        
        
        NSLayoutConstraint.activate([
            labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelName.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: 5), // 20 points from the top
        ])
        
        
        NSLayoutConstraint.activate([
            sadFace.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -150),
            sadFace.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -240),
            sadFace.widthAnchor.constraint(equalToConstant: 50),  // Set a width
            sadFace.heightAnchor.constraint(equalToConstant: 50)  // Set a height
                ])
                
                // Constraints for happyFaceButton
                NSLayoutConstraint.activate([
                    happyFace.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 150),
                    happyFace.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -240),
                    happyFace.topAnchor.constraint(equalTo: sadFace.bottomAnchor, constant: 20), // Position below sadFaceButton
                    happyFace.widthAnchor.constraint(equalToConstant: 50),  // Set a width
                    happyFace.heightAnchor.constraint(equalToConstant: 50)  // Set a height
                ])
                
                // Constraints for journalEntry
                NSLayoutConstraint.activate([
                    journalEntry.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 50),
                    journalEntry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    journalEntry.widthAnchor.constraint(equalToConstant: 300), // Set width for the text field
                    journalEntry.heightAnchor.constraint(equalToConstant: 150)  // Set height for the text field
                ])
        
                NSLayoutConstraint.activate([
                    journalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    journalLabel.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20),
                                
                ])
        
            NSLayoutConstraint.activate([
                submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                submitButton.topAnchor.constraint(equalTo: journalEntry.bottomAnchor, constant: 40),
                slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                slider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75), // 20 points from the top
                            slider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8), // 80% of the view's width
                           
                ])
        NSLayoutConstraint.activate([
            neutralFace.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            neutralFace.centerYAnchor.constraint(equalTo: slider.bottomAnchor,constant: 30),
            neutralFace.widthAnchor.constraint(equalToConstant: 50),  // Set a width
            neutralFace.heightAnchor.constraint(equalToConstant: 50)  // Set a height
        ])
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 70),
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    // MARK: - Submit Entry Action
        
        @objc func submitEntry() {
            let entryText = journalEntry.text.trimmingCharacters(in: .whitespacesAndNewlines)
            if !entryText.isEmpty {
                // Handle the submission (e.g., print to console or save it)
                print("Your response was recorded. Have a Great Day!")
                // Optionally clear the text view after submission
                responseLabel.text = "Your response was recorded. Have a Great Day!"
                journalEntry.text = ""
                result.text = entryText
            } else {
                // Optionally show an alert if the entry is empty
                print("No Response Recorded")
            }
        }
    
    //functions for when I press the buttons


}





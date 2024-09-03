import Foundation

// Enum for the possible choices
enum RPSChoice: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    // Method to get a random choice for the computer
    static func random() -> RPSChoice {
        let choices: [RPSChoice] = [.rock, .paper, .scissors]
        return choices[Int.random(in: 0..<choices.count)]
    }
}

// Function to validate and return the user's choice
func getUserChoice(_ input: String) -> RPSChoice? {
    return RPSChoice(rawValue: input.capitalized)
}

// Function to determine the winner using a dictionary of tuples
func determineWinner(userChoice: RPSChoice, computerChoice: RPSChoice) -> String {
    let winningCases: [((RPSChoice, RPSChoice), String)] = [
        ((.rock, .scissors), "User wins! Rock crushes Scissors."),
        ((.scissors, .paper), "User wins! Scissors cut Paper."),
        ((.paper, .rock), "User wins! Paper covers Rock."),
        ((.scissors, .rock), "Computer wins! Rock crushes Scissors."),
        ((.paper, .scissors), "Computer wins! Scissors cut Paper."),
        ((.rock, .paper), "Computer wins! Paper covers Rock.")
    ]
    
    if userChoice == computerChoice {
        return "It's a tie!"
    }
    
    for (pair, result) in winningCases {
        if pair == (userChoice, computerChoice) {
            return result
        }
    }
    
    return "It's a tie!"  // Default case (shouldn't be reached due to prior check)
}

// Main game logic
func playGame() {
    // Mock user input (in a real game, you'd get this from the user)
    let userInput = "paper"
    
    // Validate user choice
    guard let userChoice = getUserChoice(userInput) else {
        print("Invalid input. Please choose Rock, Paper, or Scissors.")
        return
    }
    
    let computerChoice = RPSChoice.random()
    
    // Display choices
    print("You chose \(userChoice.rawValue)")
    print("Computer chose \(computerChoice.rawValue)")
    
    // Determine and display the winner
    let result = determineWinner(userChoice: userChoice, computerChoice: computerChoice)
    print(result)
}

// Run the game
playGame()

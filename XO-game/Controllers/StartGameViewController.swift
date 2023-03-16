

import UIKit



class StartGameViewController: UIViewController {
    
    @IBOutlet weak var computerGame: UIButton!
    @IBOutlet weak var otherUserGame: UIButton!
    
    @IBOutlet weak var fiveToFiveGame: UIButton!
    // Session
    var gameSession = GameSession.shared
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func gameWithComputer(_ sender: UIButton) {
        gameSession.gameMode = .withUser
        performSegue(withIdentifier: "fromStartVCToGameVC", sender: (Any).self)
    }
    
    @IBAction func gameWithOtherUser(_ sender: UIButton) {
        gameSession.gameMode = .withComputer
        performSegue(withIdentifier: "fromStartVCToGameVC", sender: (Any).self)
    }
    @IBAction func gameFiveToFive(_ sender: UIButton) {
        gameSession.gameMode = .fiveToFive
        performSegue(withIdentifier: "fromStartVCToGameVC", sender: (Any).self)
    }
    
}

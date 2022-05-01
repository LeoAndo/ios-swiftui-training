//
//  ScoreViewController.swift
//  Quiz
//
//  Created by LeoAndo on 2022/05/01.
//

import UIKit

class ScoreViewController: UIViewController {
    var correctCount = 0
    @IBOutlet weak var scorelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scorelabel.text = "\(correctCount)問正解です！"
    }
    
    @IBAction func toTopScene(_ sender: Any) {
        // 2つ前の画面に戻る
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

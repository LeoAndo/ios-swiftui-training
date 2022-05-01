//
//  QuizViewController.swift
//  Quiz
//
//  Created by LeoAndo on 2022/05/01.
//

import UIKit

class QuizViewController: UIViewController {
    var csvArray: [String] = []
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    
    //    画面表示時に呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        csvArray = loadCSV(filename: "quiz")
        csvArray.forEach { word in print(word)}
    }
    
    @IBAction func btnAction(sender: UIButton) {
        print(sender.tag)
    }
    
    func loadCSV(filename: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: filename, ofType: "csv")
        guard let unwarpCsvBundle = csvBundle else {
            print("csvファイル読み込みエラーで早期リターンする")
            return []
        }
        do {
            let csvData = try String(contentsOfFile: unwarpCsvBundle, encoding: String.Encoding.utf8)
            let line = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = line.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("1行の読み込みエラー")
        }
        return csvArray
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

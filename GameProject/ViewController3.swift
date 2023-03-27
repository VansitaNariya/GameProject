//
//  ViewController3.swift
//  GameProject
//
//  Created by R92 on 14/03/23.
//

import UIKit

class ViewController3: UIViewController{
 
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    var highScore = UserDefaults.standard.integer(forKey: "highScore")

    
    var img = [UIImage(named: "Lion"), UIImage(named: "Girafe"), UIImage(named: "Tiger"), UIImage(named: "Monkey"), UIImage(named: "Fox"), UIImage(named: "Kangaroo"), UIImage(named: "Elephant"), UIImage(named: "Corcodile"), UIImage(named: "Squirrel")]
    
    var name: [String] = ["Lion", "Girafe", "Tiger", "Monkey", "Fox", "Kangaroo", "Elephant", "Corcodile", "Squirrel"]
    
    var randomName = ""
    var optinolName = "Dog"
    var optinolName2 = "Rabbit"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        img=img.shuffled()
        name=name.shuffled()
        scoring()
        randomName = name.randomElement()!
      timeLine()
    }
    

    @IBOutlet weak var timeOutBar: UIProgressView!
    var frequency = 0.1
    var time = Timer()
        func timeLine()
        {
            var a : Float = 1.0
            time.invalidate()
      cv.reloadData()
            self.timeOutBar.progress = a
            time = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true, block: { (time) in
                
                a -= 0.01
                self.timeOutBar.progress = a
                if self.timeOutBar.progress == 0.0
                {
                    self.time.invalidate()
                  self.scoring()
                  self.displayBox()
                }
            })
        }
    func scoring()
    {
        if highScore <= score
        {
            highScore = score
            UserDefaults.standard.set(score, forKey: "highScore")
            
        }
        
    }
    func displayBox()
    {
        scoring()
        let alert = UIAlertController(title: "Game Over", message: "Score = \(score)\n High Score = \(highScore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.score = 0
            self.scoreLabel.text = "\(self.score)"
            self.timeLine()
            self.img = self.img.shuffled()
            self.name = self.name.shuffled()
            self.cv.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Home", style: .default, handler: { _ in
            self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: false)
        }))
        present(alert, animated: true, completion: nil)
    }
}


extension ViewController3: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
     
        if randomName == img[indexPath.row]?.animalname
        {
            cell.img.image = img[indexPath.row]
            cell.name.text = img[indexPath.row]?.animalname
        }
        else
        {
            if randomName == name[indexPath.row]
            {
                cell.img.image = img[indexPath.row]
                cell.name.text = optinolName
            }
            else if img[indexPath.row]?.animalname==name[indexPath.row]
            {
                cell.img.image = img[indexPath.row]
                cell.name.text = optinolName2
            }
            else
            {
                cell.img.image = img[indexPath.row]
                cell.name.text = name[indexPath.row]
            }
        }
        
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if img[indexPath.row]!.animalname == randomName
        {
            timeLine()
            score += 1
            scoreLabel.text = "\(score)"
            img = img.shuffled()
            name = name.shuffled()
            cv.reloadData()
            randomName = name.randomElement()!
        }
        else
        {
        
        }
      
    }
}

extension ViewController3: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 5, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
extension UIImage
{
    var animalname : String
    {
        switch self
        {
        case UIImage(named:"Lion") : return "Lion"
        case UIImage(named:"Girafe") : return "Girafe"
        case UIImage(named:"Tiger") : return "Tiger"
        case UIImage(named:"Monkey") : return "Monkey"
        case UIImage(named:"Fox") : return "Fox"
        case UIImage(named:"Kangaroo") : return "Kangaroo"
        case UIImage(named:"Elephant") : return "Elephant"
        case UIImage(named:"Corcodile") : return "Corcodile"
        case UIImage(named:"Squirrel") : return "Squirrel"
            
        default :
            break
        }
        return ""
    }
}


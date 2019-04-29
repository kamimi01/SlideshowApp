//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Mika Urakawa on 2019/04/09.
//  Copyright © 2019 kamimi01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //imageviewとstoryboardとの接続
    @IBOutlet weak var UIImageView: UIImageView!
    @IBOutlet weak var backImage: UIButton!
    @IBOutlet weak var nextImage: UIButton!
    
    //前画面へ戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    var imageIndex = 0
    //タイマー
    var timer: Timer!
    //タイマー用の時間のための変数
    var timer_sec: Float = 0
    //再生/停止ボタンをタップした回数
    var tapCount:Int = 0
    
    //３画像の格納
    let images = [UIImage(named: "akiyoshi_01"), UIImage(named: "akiyoshi_02"), UIImage(named: "akiyoshi_03")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //最初は、配列[0]の画像（akiyoshi_01）を表示する
        let imageView = images[0]
        //UIImageViewにimagesを表示する
        UIImageView.image = imageView
    }
    
    //画像を次の画面へ渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //segueから遷移先のScaleViewContorllerを取得する
        let scaleViewController:ScaleViewController = segue.destination as! ScaleViewController
        //遷移先のScaleViewControllerで宣言している値を渡す
        scaleViewController.receiveImage = sender as? UIImage
    }
    
    //前の画像に戻る
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        }else{
            imageIndex -= 1
        }
        //画像の表示
        UIImageView.image = images[imageIndex]
    }
    
    //次の画像に進む
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2{
            imageIndex = 0
        }else{
            imageIndex += 1
        }
        //画像の表示
        UIImageView.image = images[imageIndex]
    }
    
    //#selector(updateTimer(_:))で呼ばれる関数
    @objc func onTimer(_ timer: Timer){
        if imageIndex == 2{
            imageIndex = 0
        }else{
            imageIndex += 1
        }
        UIImageView.image = images[imageIndex]
    }
    
    //次画面への遷移
    @IBAction func onTapImage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: images[imageIndex])
        //timerがnilかどうかの確認を行うことでエラーを解消
        if self.timer != nil{
            //画像を押すとタイマー終了
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    //画像のスライドショーを再開する/停止する
    @IBAction func startStop(_ sender: Any) {
        //ボタンのタップ回数をカウント
        tapCount += 1
        print("ボタンを押した回数：\(tapCount)")
        
        let change = tapCount % 2
        print(change)
        
        if change == 1{
            //再生ボタンを表示
            print("再生開始")
            (sender as AnyObject).setTitle("■", for: .normal)
            //他２つのボタンを無効化
            backImage.isHidden = true
            nextImage.isHidden = true
            //動作中のタイマーを１つに保つ
            if self.timer == nil{
                //再生ボタンを押すとタイマー作成、始動
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector (onTimer(_:)), userInfo: nil, repeats: true)
            }
            
        }else if change == 0{
            //停止ボタンを表示
            print("停止")
            (sender as AnyObject).setTitle("▶︎", for: .normal)
            //他2つのボタンを有効化
            backImage.isHidden = false
            nextImage.isHidden = false
            //停止ボタンを押すとタイマー終了
            self.timer.invalidate()
            self.timer = nil
        }
        
        
    }
    

}


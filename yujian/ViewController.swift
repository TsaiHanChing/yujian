//
//  ViewController.swift
//  yujian
//
//  Created by User01 on 2019/5/1.
//

import UIKit
import AVFoundation

var audioPlayer:AVAudioPlayer = AVAudioPlayer()
class ViewController: UIViewController {
    
    struct letters {
        var text:String
        var image:UIImage
        var name:String
    }
    
    var changes = [
        letters(text: "幾日不見，想來妳應已到杭州，不知近來身體可好？杭州風景極佳，雜花滿樹，落英繽紛，群鳥清鳴，大概與三清山的秀逸不相上下。倘若日後得幸同遊，必當為妳————指點江南美景。", image: #imageLiteral(resourceName: "無1"), name:"無情"),
    letters(text: "近來精神可比原先好些？謫仙島地處海濱，潮濕之氣難免，日常起居多多留心，切莫著涼。記得島外有片星羽原，因遍野皆是蒲公英而得名，月下微光閃爍，如星河倒影人間。白日風起時，又如萬千鶴羽紛紛揚揚，想來妳會喜歡的。", image: #imageLiteral(resourceName: "無2"), name:"無情"),
    letters(text: "“所謂伊人，在水一方。”今日撫琴時，想到妳，不覺指下變轉成，《蒹葭》之曲。願來日相逢，可謂卿一奏《關雎》。穎慧如卿，當知我意。惜朝之心明明如星，但願卿心亦皎皎如月。星月流光，千里相輝，不負眷念。", image: #imageLiteral(resourceName: "顧1"), name:"顧惜朝"),
    letters(text: "聞卿已至杭州，本應伴卿曲院飲酒、平湖觀燈，泛舟煙水，坐聽清歌，以盡主人之誼。奈何功名縈絆，羈留他鄉，只可遙寄相思，不勝惆悵。待卿歸來，或可為惜朝一敘故鄉之事，譬如龍井村外數竿修竹，可還如往日青青？", image:#imageLiteral(resourceName: "顧2") , name:"顧惜朝"),
    letters(text: "昨夜在窗下獨坐，忽然聽到妳喚我的名字，回頭卻並沒看到妳，不知為何有了幻覺。記得碎月灣的月色最美，不知今晚妳是不是正在海邊看月亮呢？雖然暫時不能相聚，但有月亮替我陪著妳，就像我在妳身邊一樣吧。", image: #imageLiteral(resourceName: "葉1"), name:"葉問舟"),
    letters(text: "上次為妳畫的小像，至多只有幾分形似，我試遍天下丹青筆墨，卻也勾勒不出妳眉眼間靈氣的萬分之一。落筆時，彷彿妳的一顰一笑又在眼前，嬌嗔的樣子、頑皮的樣子，還有滿臉倔強想保護我的樣子⋯⋯不知不覺，我的小丫頭，真的長大了啊。", image:#imageLiteral(resourceName: "葉2"), name:"葉問舟"),
    letters(text: "三清山的落日很美。之前我以為，天下沒有任何事情是我方應看不能辦到的，可我終究不能令時光迴轉，早一些來到妳長大的地方，再早一些遇到妳。相見恨晚，我不介意妳以餘生為補償——我要至少一百年，哪怕少了一天、少了一個時辰，都不作數。", image: #imageLiteral(resourceName: "方1"), name:"方應看"),
    letters(text: "以我“娘子”的美貌，就是汴京首飾鋪子最難得的珠寶，也未必配得上，以後這東西讓彭尖去買，不要隨便離開我身邊，我不想再讓人碰妳一下，除了手，連衣角也不行。蜜姬兒不過先前偶然結識，我拜託她幫我留心城內的消息，妳不要胡思亂想。別人怎麼看我我都不關心，但是妳，不一樣。", image: #imageLiteral(resourceName: "方2"), name:"方應看"),
    letters(text: "原先我既不了解，也不在意什麼節日。遇見妳後，才知道了那些傳說。可我不喜歡牛郎織女的故事，如果他們真想要在一起，區區天河又算什麼？如果我想見一個人，刀山火海都不能阻擋。雖然有時，只是遠遠看到你的笑容，但那就讓我覺得安心了。", image: #imageLiteral(resourceName: "燕1"), name:"燕無歸"),
    letters(text: "毀諾城確實人多勢眾，但是我告訴自己絕不可以後退。有妳在身邊，即使與全天下為敵，我也會握著兵器直到最後一刻。原來，傷人的兵器，也可以用來守護重要的人。妳要好好地活下去，我認準的事，從來不會動搖。", image:#imageLiteral(resourceName: "燕2") , name:"燕無歸")]
    
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var volumeNumber: UILabel!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var music: UISwitch!
    @IBOutlet var personality: UISegmentedControl!
    @IBOutlet var name: UITextField!
    
    @IBOutlet var date: UIDatePicker!
    @IBOutlet var outcome: UIButton!
    @IBOutlet var day: UILabel!
    @IBOutlet var name2: UILabel!
    @IBOutlet weak var context: UILabel!
    @IBOutlet weak var man: UILabel!
    var dateValue=DateFormatter()
  
    @IBAction func date(_ sender: Any) {
        dateValue = DateFormatter()
        dateValue.dateFormat = "YYYY年MM月dd日"
    }
    var volumeValue:Int = 50
    var random:Int = -1
    @IBAction func volume(_ sender: UISlider) {
        
        volumeValue = Int(sender.value)
        volumeNumber.text = "\(volumeValue)"
        audioPlayer.volume = volumeSlider.value
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
            let path = Bundle.main.path(forResource: "music", ofType: "mp3")
            let soundUrl = URL(fileURLWithPath: path!)
            do{
                try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
                audioPlayer.volume = Float(volumeValue)
                audioPlayer.numberOfLoops = -1
                audioPlayer.play()
            }catch{
                print(error)
        }
        name.delegate=self as? UITextFieldDelegate
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func music(_ sender: Any) {
        if music.isOn == true
        {
            audioPlayer.play()
        }
        else if music.isOn == false
        {
            audioPlayer.pause()
        }
        
    }

    @IBAction func receive(_ sender: Any) {
        
        
        day.text = dateValue.string(from: date.date)
        name2.text = name.text!+"，"
        
        if personality.selectedSegmentIndex == 0
        {
            random = Int.random(in: 0...5
            )
           
        }
        else
        {
           random = Int.random(in: 6...9 )

        }
         mainImage.image = changes[random].image
        
        context.text = changes[random].text
        man.text = changes[random].name
    }
}

